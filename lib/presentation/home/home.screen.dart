


import 'package:bank_mas_rewrite/presentation/home/widgets/home_blog_widget.dart';
import 'package:bank_mas_rewrite/presentation/home/widgets/home_menu_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController>{
  @override

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Assigment'),
        backgroundColor: Colors.indigo,
      ),
      body: controller.obx(
              (state) => SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [HomeMenuWidget(state!), HomeBlogWidget(state)],
              ),
            ),
          ),
          onLoading: SkeletonListView(),
          onError: (err) => Center(child: Text(err.toString()))));
  }
}