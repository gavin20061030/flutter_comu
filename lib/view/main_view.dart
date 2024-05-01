import 'package:animations/animations.dart';
import 'package:comu/controller/main_controller.dart';
import 'package:comu/route/route_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: SafeArea(
        child: Obx(() => RouteInfo.navBarPages[controller.navBarIdx.value]),
        /*child: PageTransitionSwitcher(
            transitionBuilder: (Widget child, Animation<double> anim,
                Animation<double> secondAnim) {
              return FadeThroughTransition(
                animation: secondAnim,
                secondaryAnimation: secondAnim,
                child: child,
              );
            },
            child: Obx(() => RouteInfo.navBarPages[controller.navBarIdx.value])),*/
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            selectedIndex: controller.navBarIdx.value,
            onDestinationSelected: controller.onChangeNavBar,
            destinations: [
              NavigationDestination(
                  icon: const Icon(Icons.home_filled), label: 'navBar.home'.tr),
              NavigationDestination(
                  icon: const Icon(Icons.list_alt), label: 'navBar.post'.tr),
              NavigationDestination(
                  icon: const Icon(Icons.photo), label: 'navBar.photo'.tr),
            ],
          )),
    );
  }
}
