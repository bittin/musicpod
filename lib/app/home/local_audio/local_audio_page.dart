import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:music/app/home/local_audio/local_audio_model.dart';
import 'package:music/app/player_model.dart';
import 'package:provider/provider.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LocalAudioPage extends StatefulWidget {
  const LocalAudioPage({super.key});

  @override
  State<LocalAudioPage> createState() => _LocalAudioPageState();
}

class _LocalAudioPageState extends State<LocalAudioPage> {
  @override
  Widget build(BuildContext context) {
    final localAudioModel = context.watch<LocalAudioModel>();
    final playerModel = context.watch<PlayerModel>();
    final theme = Theme.of(context);

    return localAudioModel.directory == null ||
            localAudioModel.directory!.isEmpty ||
            localAudioModel.audios == null
        ? Center(
            child: ElevatedButton(
              onPressed: () async {
                localAudioModel.directory = await getDirectoryPath();
                await localAudioModel.init();
              },
              child: const Text('Pick your music collection'),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(kYaruPagePadding),
            itemCount: localAudioModel.audios!.length,
            itemBuilder: (context, index) {
              final audioSelected =
                  playerModel.audio == localAudioModel.audios![index];

              Future<void> onTap() async {
                if (playerModel.isPlaying && audioSelected) {
                  playerModel.pause();
                } else {
                  playerModel.audio = localAudioModel.audios![index];
                  await playerModel.setImage();
                  await playerModel.play();
                }
              }

              return ListTile(
                contentPadding: const EdgeInsets.only(left: 8, right: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kYaruButtonRadius),
                ),
                onTap: onTap,
                title: Text(
                  localAudioModel.audios![index].title!,
                  style: TextStyle(
                    color: audioSelected
                        ? theme.colorScheme.onSurface
                        : theme.hintColor,
                  ),
                ),
                trailing: YaruIconButton(
                  icon: const Icon(YaruIcons.heart),
                  onPressed: () {},
                ),
              );
            },
          );
  }
}