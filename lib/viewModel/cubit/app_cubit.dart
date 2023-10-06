import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/core/services/http_helper.dart';
import 'package:itargs_challenge/models/audio_file_model.dart';
import 'package:itargs_challenge/models/top_likes.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({this.cacheHelper, this.httpHelper}) : super(AppInitial());

  static BlocProvider get(BuildContext context) => BlocProvider.of(context);

  CacheHelper? cacheHelper;
  HttpHelper? httpHelper;
  final HttpHelper httpHandler = HttpHelper();

  bool isLiked = false;

  String whenLikePressed({required int index, bool? fromPrefs}) {
    if (fromPrefs != null) {
      // DUMMY_TOPLIKES[index].isLiked = fromPrefs;
      CacheHelper.sharedPreferences?.remove('$index');
      emit(LikeBtnPressed());
    } else {
      DUMMY_TOPLIKES[index].isLiked = !DUMMY_TOPLIKES[index].isLiked!;
      CacheHelper.sharedPreferences
          ?.setBool('$index', DUMMY_TOPLIKES[index].isLiked!);
      emit(LikeBtnPressed());
    }
    return 'success';
  }

  AudioObject? audioObject;
  Future<String> getAudioFileModel(String url) async {
    emit(AppLoadingState());
    try {
      if (await InternetConnectionChecker().hasConnection) {
        var res = await httpHandler.getAudioFileFromServer(url);
        audioObject = AudioObject.fromJson(res);
        print(audioObject!.audioFileModel!.audioUrl);
        emit(AppSuccessState());
      }
      audioObject = AudioObject.fromJson(
          jsonDecode(CacheHelper.sharedPreferences!.getString('audio_cache')!));
      emit(AppSuccessState());
      return 'success';
    } catch (e) {
      print(e.toString());
      emit(AppErrorState());
      return 'fail';
    }
  }

  final player = AudioPlayer();
  bool isPlaying = false;

  Future<String> playAudioAndPause(String url) async {
    if (isPlaying) {
      await player.pause();
      isPlaying = false;
    } else {
      await player.play(UrlSource(url));
      isPlaying = true;
    }
    emit(AppSuccessState());
    return 'success';
  }

  bool isArabic = false;

  Future<String> toggleLanguage(bool value) async {
    isArabic = value;
    CacheHelper.sharedPreferences!.setBool('switch', isArabic);
    if (isArabic) {
      Get.updateLocale(Locale('ar'));
      await CacheHelper.sharedPreferences?.setString('code', 'ar');
    } else {
      Get.updateLocale(Locale('en'));
      await CacheHelper.sharedPreferences?.setString('code', 'en');
    }
    emit(ToggleLanguageState());
    return 'success';
  }

  bool isDark = false;
  Future<String> toggleTheme({bool? fromShared}) async {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ToggleThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.sharedPreferences!.setBool('isDark', isDark);
      emit(ToggleThemeState());
    }
    return 'success';
  }

  AudioPlayer audioPlayer = AudioPlayer();
  String? audioFilePath;

  cacheAudio() {
    httpHandler
        .downloadAndCacheAudio(audioObject!.audioFileModel!.audioUrl!)
        .then((path) {
      audioFilePath = path;
      emit(DownloadAudioState());
    });
  }
}
