import 'package:comu/common/code_info.dart';
import 'package:comu/common/const.dart';
import 'package:comu/dao/photo_dao.dart';
import 'package:comu/dto/photo_bean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PhotoBean> photos = <PhotoBean>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getPhotos();
  }

  void onRefresh() {
    _getPhotos();
  }

  Future<void> _getPhotos() async {
    isLoading(true);
    try {
      Map<String, dynamic> result = await PhotoDao.to.getPhotos();
      CodeInfo code = result[gCode];
      if(code == CodeInfo.ok) {
        List<PhotoBean> list = result[gList];
        photos.clear();
        photos.addAll(list);
      }else {
        Get.snackbar('err.title.info'.tr, 'err.try'.tr, icon: const Icon(Icons.error));
      }
    } catch (e) {
      Get.snackbar('err.title.error'.tr, 'err.try'.tr, icon: const Icon(Icons.error));
    }
    isLoading(false);
  }

  void showPhoto(int idx) {
    Get.dialog(
      AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(photos[idx].downloadUrl),
            const SizedBox(height: 16.0),
            const Icon(Icons.person),
            Text(photos[idx].author),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('btn.close'.tr),
          ),
        ],
      )
    );
  }
}