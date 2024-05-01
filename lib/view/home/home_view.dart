import 'package:comu/component/loading_widget.dart';
import 'package:comu/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              Card(
                  margin: const EdgeInsets.all(16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(children: [
                      Image.asset(
                        'assets/img/flutter.png',
                        width: 45.0,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(child: Text('home.card.1'.tr))
                    ]),
                  )),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FlutterLogo(size: 45.0),
                          const SizedBox(height: 16.0),
                          Text('home.card.2'.tr)
                        ]),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.flutter_dash,
                            color: Colors.lightBlue,
                          ),
                          const SizedBox(height: 16.0),
                          Text('home.card.3'.tr)
                        ]),
                  ),
                ),
              )
            ],
          ),
          Obx(() => LoadingWidget(controller.isLoading.value)),
        ],
      )),
    );
  }
}
