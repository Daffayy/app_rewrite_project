


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/model/home_response_model.dart';
import '../controllers/home.controller.dart';

class HomeMenuWidget extends GetView<HomeController>{
  final HomeResponseModel state;

  const HomeMenuWidget(this.state, {Key? key}) : super (key: key);

  @override
  Widget build (BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: EdgeInsets.all(16),
        height: 300,
        width: Get.width,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemCount: state.data.first.items.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () async => controller.launchBrowser(state.data.first
                  .items[i].link),
              child: CachedNetworkImage(
                imageUrl: state.data.last.items[i].productImage!),
            )),
      ),
    );
  }
}