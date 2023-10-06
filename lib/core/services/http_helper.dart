import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:itargs_challenge/core/services/cache_helper.dart';
import 'package:path_provider/path_provider.dart';

class HttpHelper {
  Future<Map<String, dynamic>> getAudioFileFromServer(String url) async {
    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> map = jsonDecode(response.body);
    CacheHelper.sharedPreferences?.setString('audio_cache', jsonEncode(map));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ' ';
    }
  }

  Future<String?> downloadAndCacheAudio(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Directory appDocDir = await getApplicationDocumentsDirectory();
        final String filePath = '${appDocDir.path}/audio.mp3';

        final File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        return filePath;
      } else {
        print('Failed to download audio: ${response.statusCode}');
        return '';
      }
    } catch (e) {
      print('Error downloading and caching audio: $e');
      return '';
    }
  }
}
