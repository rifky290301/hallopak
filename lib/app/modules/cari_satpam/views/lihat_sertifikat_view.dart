import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:photo_view/photo_view.dart';

class LihatSertifikatView extends StatelessWidget {
  LihatSertifikatView({super.key, required this.image});
  String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(imageProvider: NetworkImage(image)),
          Positioned(
            top: 60,
            left: 30,
            child: Container(
              height: 45,
              width: 45,
              // margin: EdgeInsets.only(left: AppSize.medium, top: AppSize.medium, bottom: AppSize.medium),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.small),
                color: const Color(0xFFFDF5ED),
              ),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Color(0xFFDA6317),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
