import 'dart:io';

import 'package:comu/api/api_info.dart';
import 'package:comu/common/code_info.dart';
import 'package:comu/dto/photo_bean.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PhotoDao extends GetConnect {
  static PhotoDao get to => Get.put(PhotoDao());

  @override
  void onInit() {
    httpClient.baseUrl = ApiInfo.rootPostUrl;
    httpClient.defaultContentType = 'application/x-www-form-urlencoded';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Map<String, dynamic>> getPhotos() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PhotoBean> list = [];
    try {
      final response = await get('/v2/list?page=2&limit=10');
      if (response.statusCode == HttpStatus.ok) {
        list = response.body.map<PhotoBean>((json) => PhotoBean.fromJson(json)).toList();
      } else {
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }
    resultMap['code'] = code;
    resultMap['list'] = list;
    return resultMap;
  }
}
