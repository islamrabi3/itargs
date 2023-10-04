import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:itargs_challenge/core/constance.dart';
import 'package:itargs_challenge/core/services/cache_helper.dart';
class HttpHelper {
 static Future<Map<String, dynamic>> getAudioFileFromServer ()async{
     var response =await http.get(Uri.parse(apiUrl));
      Map<String, dynamic> map = jsonDecode(response.body);
      CacheHelper.sharedPreferences?.setString('audio_cache', jsonEncode(map));
     if(response.statusCode ==200) {
      return jsonDecode(response.body);
    } else{
       throw ' ';
     }
  }
}