import 'package:comu/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostDetailView extends GetView<PostController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('post.detail.title'.tr),
      ),
      body: SafeArea(
        child: Obx(() => _detail()),
      ),
    );
  }

  Widget _detail() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.postDetail.value.title,
              style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              height: 48.0,
            ),
            Text(controller.postDetail.value.body),
          ],
        ),
      ),
    );
  }
}
