
import 'package:comu/component/loading_widget.dart';
import 'package:comu/controller/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _posts(),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ]
        )
      ),
    );
  }

  Widget _posts() {
    return ListView.separated(
      itemCount: controller.posts.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: ListTile(
            leading: const Icon(Icons.article_outlined),
            title: Text(controller.posts[index].title, maxLines: 1, overflow: TextOverflow.ellipsis,),
          ),
          onTap: () {
            controller.toPostDetail(controller.posts[index].id);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}