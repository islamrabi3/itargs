import 'package:get/utils.dart';
import 'package:hive/hive.dart';
part 'top_likes.g.dart';

@HiveType(typeId: 1)
class TopLikesText {
  @HiveField(2)
  String? textSample;
  @HiveField(3)
  bool? isLiked;

  TopLikesText({required this.textSample, this.isLiked});
}

var DUMMY_TOPLIKES = [
  TopLikesText(textSample: '1', isLiked: false),
  TopLikesText(textSample: '2', isLiked: false),
  TopLikesText(textSample: '3', isLiked: false),
  TopLikesText(textSample: '4', isLiked: false),
  TopLikesText(textSample: '5', isLiked: false),
  TopLikesText(textSample: '6', isLiked: false),
  TopLikesText(textSample: '7', isLiked: false),
  TopLikesText(textSample: '8', isLiked: false),
  TopLikesText(textSample: '9', isLiked: false),
];
