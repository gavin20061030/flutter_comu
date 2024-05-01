import 'package:comu/view/home/home_view.dart';
import 'package:comu/view/main_view.dart';
import 'package:comu/view/photo/photo_view.dart';
import 'package:comu/view/post/post_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteInfo {
  static const String routeRoot = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => const MainView())
  ];

  static List<Widget> navBarPages = const [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}