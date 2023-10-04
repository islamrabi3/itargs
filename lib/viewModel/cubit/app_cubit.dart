import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/core/services/http_helper.dart';
import 'package:itargs_challenge/models/audio_file_model.dart';
import 'package:itargs_challenge/models/top_likes.dart';
import 'package:http/http.dart' as http;

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static BlocProvider get(BuildContext context) => BlocProvider.of(context);

  bool isLiked = false;

  whenLikePressed(index) {
    DUMMY_TOPLIKES[index].isLiked = !DUMMY_TOPLIKES[index].isLiked!;
    // CacheHelper.sharedPreferences?.setBool('$index', DUMMY_TOPLIKES[index].isLiked!);
    // DUMMY_TOPLIKES[index].isLiked = CacheHelper.sharedPreferences?.getBool('$index') ??false;
    // print(Hive.box('text_likes').getAt(index));
    emit(LikeBtnPressed());
  }

  AudioObject? audioObject;

  getAudioFileModel() async {
    emit(AppLoadingState());
    try {
      if (await InternetConnectionChecker().hasConnection) {
        var res = await HttpHelper.getAudioFileFromServer();
        audioObject = AudioObject.fromJson(res);
        print(audioObject!.audioFileModel!.audioUrl);
        emit(AppSuccessState());
      }
        audioObject = AudioObject.fromJson(jsonDecode(
            CacheHelper.sharedPreferences!.getString('audio_cache')!));
      emit(AppSuccessState());
    } catch (e) {
      print(e.toString());
      emit(AppErrorState());
    }
  }

  final player = AudioPlayer();
  bool isPlaying = false;

  playAudioAndPause() async {
    if (isPlaying) {
      await player.pause();

      isPlaying = false;
    } else {
      await player.play(UrlSource(audioObject!.audioFileModel!.audioUrl!));
      isPlaying = true;
    }
    emit(AppSuccessState());
  }
}
