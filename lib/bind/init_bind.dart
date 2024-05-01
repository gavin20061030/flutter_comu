import 'package:comu/controller/home_controller.dart';
import 'package:comu/controller/main_controller.dart';
import 'package:comu/controller/post_controller.dart';
import 'package:get/get.dart';

class InitBind implements Bindings {

  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(PostController());
  }
}