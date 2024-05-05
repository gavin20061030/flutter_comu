import 'dart:io';
import 'dart:math';

import 'package:comu/api/api_info.dart';
import 'package:comu/common/code_info.dart';
import 'package:comu/common/const.dart';
import 'package:comu/dto/photo_bean.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:logger/logger.dart';


class PhotoDao extends GetConnect {
  var logger = Logger();
  static PhotoDao get to => Get.put(PhotoDao());

  @override
  void onInit() {
    httpClient.baseUrl = ApiInfo.rootPhotoUrl;
    httpClient.defaultContentType = gHttpContentType;
    httpClient.addRequestModifier((Request request) {
      request.headers[gHttpHeaderAccept] = gHttpHeaderAcceptJson;
      return request;
    });
  }

  Future<Map<String, dynamic>> getPhotos() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PhotoBean> list = [];
    try {
      final response = await get('/v2/list?page=2&limit=100');
      if (response.statusCode == HttpStatus.ok) {
        list = response.body.map<PhotoBean>((json) => PhotoBean.fromJson(json)).toList();
      } else {
        logger.d("photo response: ${response.statusCode}");
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }
    resultMap[gCode] = code;
    resultMap[gList] = list;
    return resultMap;
  }
}
