import 'package:comu/common/const.dart';
import 'package:comu/component/loading_widget.dart';
import 'package:comu/controller/photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo_outlined),
        onPressed: () {
          Get.snackbar('Add', 'Photo',
              icon: const Icon(Icons.add_a_photo_outlined));
        },
      ),
    );
  }

  Widget _photos() {
    return LiquidPullToRefresh(
      color: gPullRefreshColor,
      backgroundColor: gPullRefreshBgColor,
      showChildOpacityTransition: gPullRefreshShowChildOpacityTransition,
      springAnimationDurationInMilliseconds: gPullRefreshSpringAnimationDurationInMilliseconds,
      onRefresh: () async {
        controller.onRefresh();
      },
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: controller.photos.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    controller.photos[index].downloadUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                controller.showPhoto(index);
              },
            );
          },
        ),
      ),
    );
  }
}
