
import 'package:hive/hive.dart';
part 'top_likes.g.dart';
@HiveType(typeId: 1)
class TopLikesText {
  @HiveField(2)
  String? textSample;
  @HiveField(3)
  bool? isLiked ;

  TopLikesText ({ required this.textSample ,this.isLiked});
}


var DUMMY_TOPLIKES = [
  TopLikesText(textSample: 'The only way to do great work is to love what you do." - Steve Jobs', isLiked: false),
  TopLikesText(textSample: 'In three words I can sum up everything I have learned about life: it goes on', isLiked: false),
  TopLikesText(textSample: 'Success is not final, failure is not fatal: It is the courage to continue that counts', isLiked: false),
  TopLikesText(textSample: 'The only limit to our realization of tomorrow will be our doubts of today.', isLiked: false),
  TopLikesText(textSample: 'The best way to predict the future is to create it.', isLiked: false),
  TopLikesText(textSample: 'The only way to do great work is to love what you do." - Steve Jobs', isLiked: false),
  TopLikesText(textSample: 'The only way to do great work is to love what you do." - Steve Jobs', isLiked: false),
  TopLikesText(textSample: 'The only way to do great work is to love what you do." - Steve Jobs', isLiked: false),
  TopLikesText(textSample: 'The only way to do great work is to love what you do." - Steve Jobs', isLiked: false),
];

