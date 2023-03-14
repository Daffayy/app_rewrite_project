


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletons/skeletons.dart';

import '../../../domain/model/home_response_model.dart';
import '../controllers/home.controller.dart';

class HomeBlogWidget extends GetView<HomeController>{
  final HomeResponseModel state;

  const HomeBlogWidget(this.state,{Key? key}) : super(key:key);

  @override
  Widget build (BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
          child: Text(
            'Our Blog',
          ),
        ),
        SizedBox(
          height: Get.height,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) => GestureDetector(
                onTap: () async => controller.launchBrowser(state.data.first
                    .items[index].link),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                            width: Get.width,
                            imageUrl: state.data.first.items[index]
                                .articleImage!,
                            fit: BoxFit.cover,
                            placeholder: (context,_) => const SkeletonAvatar(),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          width: Get.width,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          ),
                          child: Text(
                            state.data.first.items[index].articleTitle!,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            itemCount: 3),
        )
      ],
    );
  }
}