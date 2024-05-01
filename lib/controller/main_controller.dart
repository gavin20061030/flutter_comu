import 'package:get/get.dart';

class MainController extends GetxController {
  RxString title = 'title'.tr.obs;

  RxInt navBarIdx = 0.obs;

  void onChangeNavBar(int idx) {
    if (navBarIdx.value != idx) {
      navBarIdx.value = idx;

      switch (idx) {
        case 1:
          title('post.title'.tr);
          break;
        case 2:
          title('photo.title'.tr);
          break;
        default:
          title('title'.tr);
      }
    }
  }
}
