import 'package:comu/api/api_info.dart';
import 'package:comu/common/code_info.dart';
import 'package:comu/common/const.dart';
import 'package:comu/dto/post_bean.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class PostDao extends GetConnect {

  static PostDao get to => Get.put(PostDao());

  @override
  void onInit() {
    httpClient.baseUrl = ApiInfo.rootPostUrl;
    httpClient.defaultContentType = gHttpContentType;
    httpClient.addRequestModifier((Request request) {
      request.headers[gHttpHeaderAccept] = gHttpHeaderAcceptJson;
      return request;
    });
  }

  Future<Map<String, dynamic>> getPosts() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PostBean> list = [];
    try {
      final Response response = await get('/posts');
      if (response.statusCode == HttpStatus.ok) {
        list = response.body
            .map<PostBean>((json) => PostBean.fromJson(json))
            .toList();
      } else {
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }
    resultMap[gCode] = code;
    resultMap[gList] = list;
    return resultMap;
  }

  Future<Map<String, dynamic>> getPost(int id) async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    PostBean postBean = PostBean();
    try {
      final Response response = await get('/posts/$id');
      if (response.statusCode == HttpStatus.ok) {
        postBean = PostBean.fromJson(response.body);
      } else {
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }
    resultMap[gCode] = code;
    resultMap[gBean] = postBean;
    return resultMap;
  }
}
