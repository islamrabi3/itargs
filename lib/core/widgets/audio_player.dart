import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';

class AudioPlayerWidget extends StatelessWidget {
  const AudioPlayerWidget({
    super.key,
    required this.cubit,
  });

  final AppCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (cubit.audioFilePath != null) {
                var cache = await cubit.audioPlayer.audioCache
                    .load(cubit.audioFilePath!);
                cubit.audioPlayer.play(UrlSource(cache as String));
              } else {
                cubit.playAudioAndPause(
                    cubit.audioObject!.audioFileModel!.audioUrl!);
              }
            },
            child: cubit.isPlaying
                ? SvgPicture.asset('assets/pause.svg')
                : SvgPicture.asset('assets/play.svg'),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Text('playing'.tr)
        ],
      ),
    );
  }
}
