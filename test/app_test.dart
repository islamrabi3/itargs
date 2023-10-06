import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:itargs_challenge/core/services/http_helper.dart';
import 'package:itargs_challenge/models/audio_file_model.dart';
import 'package:itargs_challenge/viewModel/cubit/app_cubit.dart';
import 'package:mockito/mockito.dart';

class MockCacheHelper extends Mock implements CacheHelper {} // Mock CacheHelper

class MockHttpHelper extends Mock implements HttpHelper {} // Mock HttpHelper

class MockAppCubit extends MockCubit<AppState> implements AppCubit {}

void main() {
  test('Http Helper Test ', () async {
    var httpHandler = HttpHelper();
    var result = await httpHandler.getAudioFileFromServer(apiUrl);
    expect(result, isA<Map<String, dynamic>>());
  });

  test('Download Cached Audio', () async {
    var httpHandler = HttpHelper();

    var result = await httpHandler.downloadAndCacheAudio(
        'https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/1.mp3');
    expect(result, isA<String>());
  });
}
