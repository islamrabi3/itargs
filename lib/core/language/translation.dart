import 'package:get/get.dart';
import 'package:itargs_challenge/core/language/ar.dart';
import 'package:itargs_challenge/core/language/en.dart';

class LanguageTranslate extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
