import 'package:get/get.dart';

class TranslationsInfo extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'ko': ko};

  final Map<String, String> enUS = {
    'title': 'Comu',
    'post.title': 'Post',
    'photo.title': 'Photo',

    'navBar.home': 'Home',
    'navBar.post': 'Post',
    'navBar.photo': 'Photo'
  };

  final Map<String, String> ko = {
    'title': '커뮤',
    'post.title': '포스트',
    'photo.title': '사진첩',

    'navBar.home': '홈',
    'navBar.post': '포스트',
    'navBar.photo': '사진첩'
  };
}
