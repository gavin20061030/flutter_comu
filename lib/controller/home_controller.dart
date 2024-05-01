import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    _getData();
  }

  Future<void> _getData() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 3));
    isLoading(false);
  }
}