import 'package:comu/bind/post_detail_bind.dart';
import 'package:comu/view/home/home_view.dart';
import 'package:comu/view/main_view.dart';
import 'package:comu/view/photo/photo_view.dart';
import 'package:comu/view/post/post_detail_view.dart';
import 'package:comu/view/post/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteInfo {
  static const String routeRoot = '/';
  static const String routePostDetail = '/post/detail';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => const MainView()),
    GetPage(
        name: routePostDetail,
        page: () => const PostDetailView(),
        binding: PostDetailBind()),
  ];

  static List<Widget> navBarPages = const [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}
