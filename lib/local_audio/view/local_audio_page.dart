import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../../common/data/audio_type.dart';
import '../../common/view/adaptive_container.dart';
import '../../common/view/header_bar.dart';
import '../../common/view/no_search_result_page.dart';
import '../../common/view/search_button.dart';
import '../../common/view/sliver_filter_app_bar.dart';
import '../../common/view/theme.dart';
import '../../common/view/ui_constants.dart';
import '../../constants.dart';
import '../../l10n/l10n.dart';
import '../../library/library_model.dart';
import '../../search/search_model.dart';
import '../../search/search_type.dart';
import '../../settings/view/settings_action.dart';
import '../local_audio_model.dart';
import '../local_audio_view.dart';
import 'failed_imports_content.dart';
import 'local_audio_body.dart';
import 'local_audio_control_panel.dart';

class LocalAudioPage extends StatefulWidget with WatchItStatefulWidgetMixin {
  const LocalAudioPage({super.key});

  @override
  State<LocalAudioPage> createState() => _LocalAudioPageState();
}

class _LocalAudioPageState extends State<LocalAudioPage> {
  @override
  void initState() {
    super.initState();
    di<LocalAudioModel>().init().then((_) {
      final failedImports = di<LocalAudioModel>().failedImports;
      if (mounted && failedImports?.isNotEmpty == true) {
        showFailedImportsSnackBar(
          failedImports: failedImports!,
          context: context,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final audios = watchPropertyValue((LocalAudioModel m) => m.audios);
    final allArtists = watchPropertyValue((LocalAudioModel m) => m.allArtists);
    final allAlbumArtists =
        watchPropertyValue((LocalAudioModel m) => m.allAlbumArtists);

    final allAlbums = watchPropertyValue((LocalAudioModel m) => m.allAlbums);
    final allGenres = watchPropertyValue((LocalAudioModel m) => m.allGenres);
    final playlists =
        watchPropertyValue((LibraryModel m) => m.playlists.keys.toList());
    final index = watchPropertyValue((LocalAudioModel m) => m.localAudioindex);
    final localAudioView = LocalAudioView.values[index];

    return Scaffold(
      appBar: HeaderBar(
        adaptive: true,
        titleSpacing: 0,
        actions: [
          Padding(
            padding: appBarSingleActionSpacing,
            child: SearchButton(
              active: false,
              onPressed: () {
                di<LibraryModel>().push(pageId: kSearchPageId);
                final searchmodel = di<SearchModel>();
                searchmodel
                  ..setAudioType(AudioType.local)
                  ..setSearchType(SearchType.localTitle)
                  ..search();
              },
            ),
          ),
        ],
        title: Text(context.l10n.localAudio),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              if (audios != null && audios.isNotEmpty)
                SliverFilterAppBar(
                  padding:
                      getAdaptiveHorizontalPadding(constraints: constraints)
                          .copyWith(
                    bottom: filterPanelPadding.bottom,
                    top: filterPanelPadding.top,
                  ),
                  title: const LocalAudioControlPanel(),
                ),
              SliverPadding(
                padding: getAdaptiveHorizontalPadding(constraints: constraints)
                    .copyWith(
                  bottom: bottomPlayerPageGap,
                ),
                sliver: audios != null && audios.isEmpty
                    ? SliverFillNoSearchResultPage(
                        icon: const AnimatedEmoji(AnimatedEmojis.bird),
                        message: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(context.l10n.noLocalTitlesFound),
                            const SizedBox(
                              height: kLargestSpace,
                            ),
                            const SettingsButton.important(),
                          ],
                        ),
                      )
                    : LocalAudioBody(
                        localAudioView: localAudioView,
                        titles: audios,
                        albums: allAlbums,
                        artists: allArtists,
                        albumArtists: allAlbumArtists,
                        genres: allGenres,
                        playlists: playlists,
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
