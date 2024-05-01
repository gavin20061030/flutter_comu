import 'package:comu/component/loading_widget.dart';
import 'package:comu/controller/photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoView extends GetView<PhotoController> {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _photos(),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ],
        ),
      ),
    );
  }

  Widget _photos() {
    return Obx(
      () => GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controller.photoList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              controller.photoList[index].downloadUrl,
              fit: BoxFit.cover,
            ),
          ));
        },
      ),
    );
  }
}
