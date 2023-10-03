

class AudioObject {
  AudioFileModel? audioFileModel;

  AudioObject.fromJson(Map<String ,dynamic>json){
     audioFileModel = json['audio_file'];
  }
}

class AudioFileModel {
  int ? id , chapterId, fileSize ;
  String ? format, audioUrl;

  AudioFileModel.fromJson (Map<String, dynamic> json){
    id= json['id'];
    chapterId= json['chapter_id'];
    fileSize= json['file_size'];
    format= json['format'];
    audioUrl= json['audio_url'];
  }
  }