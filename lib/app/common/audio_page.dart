import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:music/app/common/audio_page_control_panel.dart';
import 'package:music/app/common/audio_page_header.dart';
import 'package:music/app/common/audio_tile.dart';
import 'package:music/app/common/search_field.dart';
import 'package:music/app/local_audio/local_audio_model.dart';
import 'package:music/app/player_model.dart';
import 'package:music/app/playlists/playlist_dialog.dart';
import 'package:music/app/playlists/playlist_model.dart';
import 'package:music/data/audio.dart';
import 'package:music/l10n/l10n.dart';
import 'package:music/utils.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({
    super.key,
    required this.audios,
    required this.pageId,
    required this.editableName,
    required this.deletable,
    this.title,
    this.imageUrl,
    this.likePageButton,
    this.sort = true,
    this.showTrack = true,
    this.showWindowControls = true,
    this.likeIcon,
    this.unLikeIcon,
    this.pageLabel,
    this.pageDescription,
    this.pageTitle,
    this.pageSubtile,
    this.image,
    this.placeTrailer = true,
  });

  final Set<Audio>? audios;
  final String? pageLabel;
  final String pageId;
  final String? pageTitle;
  final String? pageDescription;
  final String? pageSubtile;
  final bool editableName;
  final bool deletable;
  final Widget? likePageButton;
  final Widget? title;
  final String? imageUrl;
  final bool sort;
  final bool showTrack;
  final bool showWindowControls;
  final Widget? likeIcon;
  final Widget? unLikeIcon;
  final Widget? image;
  final bool? placeTrailer;

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late ScrollController _controller;
  int _amount = 40;
  AudioFilter _filter = AudioFilter.trackNumber;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        setState(() {
          _amount++;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final playerModel = context.watch<PlayerModel>();
    final playlistModel = context.watch<PlaylistModel>();
    final theme = Theme.of(context);
    final light = theme.brightness == Brightness.light;

    Widget? body;
    body = const Center(
      child: YaruCircularProgressIndicator(),
    );

    if (widget.audios != null) {
      var sortedAudios = widget.audios!.toList();

      if (widget.sort) {
        sortListByAudioFilter(audioFilter: _filter, audios: sortedAudios);
      }

      body = SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            if (widget.placeTrailer == true)
              Container(
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      light ? Colors.white : Colors.transparent,
                      light ? const Color(0xFFfafafa) : theme.cardColor
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.image != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: widget.image!,
                        ),
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.pageLabel ?? context.l10n.album,
                            style: theme.textTheme.labelSmall,
                          ),
                          Text(
                            widget.pageTitle ??
                                sortedAudios.firstOrNull?.metadata?.album ??
                                '',
                            style: theme.textTheme.headlineLarge?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 50,
                              color:
                                  theme.colorScheme.onSurface.withOpacity(0.8),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.pageSubtile ??
                                sortedAudios.firstOrNull?.metadata?.artist ??
                                '',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.hintColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: SizedBox(
                                width: 500,
                                child: Text(
                                  widget.pageDescription ??
                                      sortedAudios.firstOrNull?.description
                                          ?.trim() ??
                                      '',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.hintColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 15,
              ),
              child: AudioPageControlPanel(
                listName: widget.pageId,
                likeButton: widget.likePageButton,
                editableName: widget.editableName,
                audios: sortedAudios.toSet(),
                deletable: widget.deletable,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: AudioPageHeader(
                showTrack: widget.showTrack,
                audioFilter: AudioFilter.title,
                onAudioFilterSelected: (audioFilter) => setState(() {
                  _filter = audioFilter;
                }),
              ),
            ),
            const Divider(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children:
                    List.generate(sortedAudios.take(_amount).length, (index) {
                  final audio = sortedAudios.elementAt(index);
                  final audioSelected = playerModel.audio == audio;

                  final liked = playlistModel.liked(audio);

                  return AudioTile(
                    isPlayerPlaying: playerModel.isPlaying,
                    pause: playerModel.pause,
                    play: () {
                      WidgetsBinding.instance
                          .addPostFrameCallback((timeStamp) async {
                        if (context.mounted) {
                          playerModel.audio = audio;
                          await playerModel.play();
                        }
                      });
                    },
                    key: ValueKey(audio),
                    selected: audioSelected,
                    audio: audio,
                    likeIcon: YaruPopupMenuButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(kYaruButtonRadius),
                        ),
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            child: Text(context.l10n.createNewPlaylist),
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return ChangeNotifierProvider.value(
                                  value: playlistModel,
                                  child: PlaylistDialog(
                                    name: widget.pageId,
                                    deletable: widget.deletable,
                                    audios: {audio},
                                    editableName: widget.editableName,
                                  ),
                                );
                              },
                            ),
                          ),
                          if (playlistModel.playlists
                              .containsKey(widget.pageId))
                            PopupMenuItem(
                              child: Text('Remove from ${widget.pageId}'),
                              onTap: () =>
                                  playlistModel.removeAudioFromPlaylist(
                                widget.pageId,
                                audio,
                              ),
                            ),
                          for (final playlist in playlistModel.playlists.entries
                              .take(5)
                              .toList())
                            if (playlist.key != 'likedAudio')
                              PopupMenuItem(
                                child: Text(
                                  '${context.l10n.addTo} ${playlist.key == 'likedAudio' ? context.l10n.likedSongs : playlist.key}',
                                ),
                                onTap: () => playlistModel.addAudioToPlaylist(
                                  playlist.key,
                                  audio,
                                ),
                              )
                        ];
                      },
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => liked
                            ? playlistModel.removeLikedAudio(audio)
                            : playlistModel.addLikedAudio(audio),
                        child: Icon(
                          liked ? YaruIcons.heart_filled : YaruIcons.heart,
                          color: audioSelected
                              ? theme.colorScheme.onSurface
                              : theme.hintColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      );
    }

    return YaruDetailPage(
      backgroundColor: theme.brightness == Brightness.dark
          ? const Color.fromARGB(255, 37, 37, 37)
          : Colors.white,
      appBar: YaruWindowTitleBar(
        style: widget.showWindowControls
            ? YaruTitleBarStyle.normal
            : YaruTitleBarStyle.undecorated,
        title: widget.title ??
            SearchField(
              spawnedPageLikeButton: widget.likePageButton,
              spawnPageWithWindowControls: widget.showWindowControls,
            ),
        leading: Navigator.canPop(context)
            ? const YaruBackButton(
                style: YaruBackButtonStyle.rounded,
              )
            : const SizedBox(
                width: 40,
              ),
      ),
      body: body,
    );
  }
}
