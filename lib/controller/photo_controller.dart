import 'package:comu/common/code_info.dart';
import 'package:comu/dao/photo_dao.dart';
import 'package:comu/dto/photo_bean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhotoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PhotoBean> photoList = <PhotoBean>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getPhotos();
  }

  Future<void> _getPhotos() async {
    isLoading(true);
    try {
      final Map<String, dynamic> result = await PhotoDao.to.getPhotos();
      CodeInfo code = result['code'];
      if(code == CodeInfo.ok) {
        List<PhotoBean> list = result['list'];
        photoList.clear();
        photoList.addAll(list);
      }else {
        Get.snackbar('err.title.info'.tr, 'err.try'.tr, icon: const Icon(Icons.error));
      }
    } catch (e) {
      Get.snackbar('err.title.error'.tr, 'err.try'.tr, icon: const Icon(Icons.error));
    }
    isLoading(false);
  }
}