import 'package:get/get.dart';

class TranslationsInfo extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUS, 'ko': ko};

  final Map<String, String> enUS = {
    'err.title.info': 'Info',
    'err.title.error': 'Error',
    'err.try': 'Please try again later.',

    'title': 'Comu',
    'post.title': 'Post',
    'photo.title': 'Photo',
    'post.detail.title': 'Post Detail',

    'navBar.home': 'Home',
    'navBar.post': 'Post',
    'navBar.photo': 'Photo',
    'home.card.1': 'Build apps for any screen',
    'home.card.2': 'Ship features faster with less code while targeting Android, iOS, web, Windows, macOS, and Linux in a single codebase.',
    'home.card.3': 'Ship features faster with less code while targeting Android, iOS, web, Windows, macOS, and Linux in a single codebase.',
  };

  final Map<String, String> ko = {
    'err.title.info': '안내',
    'err.title.error': '에러',
    'err.try': '잠시후 다시 시도 해주세요.',

    'title': '커뮤',
    'post.title': '포스트',
    'photo.title': '사진첩',
    'post.detail.title': '포스트 상세',

    'navBar.home': '홈',
    'navBar.post': '포스트',
    'navBar.photo': '사진첩',


    'home.card.1': 'Build apps for any screen',
    'home.card.2': 'Ship features faster with less code while targeting Android, iOS, web, Windows, macOS, and Linux in a single codebase.',
    'home.card.3': 'Ship features faster with less code while targeting Android, iOS, web, Windows, macOS, and Linux in a single codebase.',
  };
}
