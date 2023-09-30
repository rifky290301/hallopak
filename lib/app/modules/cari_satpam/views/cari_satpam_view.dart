import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/cari_satpam_controller.dart';
import 'detail_satpam_view.dart';

class CariSatpamView extends GetView<CariSatpamController> {
  const CariSatpamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.appBack,
              AppHeader.appText('Cari Satpam'),
              // Container(
              //   padding: const EdgeInsets.only(left: AppSize.medium, right: AppSize.medium, bottom: AppSize.medium),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Cari Satpam',
              //       hintStyle: AppTextStyle.textMedium.copyWith(color: AppColors.coba2),
              //       prefixIcon: Icon(Icons.search, color: AppColors.coba2),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(AppSize.semiSmall),
              //         borderSide: BorderSide(color: AppColors.coba2),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(AppSize.semiSmall),
              //         borderSide: BorderSide(color: AppColors.coba2),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(AppSize.semiSmall),
              //         borderSide: BorderSide(color: AppColors.coba2),
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: GetBuilder<CariSatpamController>(
                  id: 'list',
                  init: controller,
                  builder: (_) {
                    if (_.isLoad) {
                      return GridView.builder(
                        itemCount: 8,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppSize.medium,
                          crossAxisSpacing: AppSize.medium,
                        ),
                        itemBuilder: (context, index) {
                          return const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                              borderRadius: BorderRadius.all(Radius.circular(AppSize.semiSmall)),
                            ),
                          );
                        },
                      );
                    } else if (_.users.isEmpty) {
                      return Center(
                        child: Text(
                          'Tidak ada satpam',
                          style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                        ),
                      );
                    }
                    return GridView.builder(
                      itemCount: _.users.length,
                      padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .8,
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSize.medium,
                        crossAxisSpacing: AppSize.medium,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(
                            () => DetailSatpamView(),
                            arguments: [_.profiles[index], _.users[index], _.listUlasan[index]],
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(AppSize.small),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(20, 788, 90, 0.2),
                                  spreadRadius: 0,
                                  blurRadius: 50,
                                  offset: Offset(11, 28),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(AppSize.semiSmall),
                                    child: Image.network(_.profiles[index].profile ?? '', fit: BoxFit.cover,
                                        loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.primary,
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                                  loadingProgress.expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    }),
                                    // child: CachedNetworkImage(
                                    //   imageUrl: _.profiles[index].profile ?? '',
                                    //   height: 100,
                                    //   fit: BoxFit.cover,
                                    //   placeholder: (context, url) => Center(
                                    //     child: CircularProgressIndicator(color: AppColors.primary),
                                    //   ),
                                    //   errorWidget: (context, url, error) => const Icon(Icons.error),
                                    // ),
                                  ),
                                ),
                                const SizedBox(height: AppSize.micro),
                                Text(
                                  _.profiles[index].nama ?? '',
                                  style: AppTextStyle.textMedium,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                RatingBar.builder(
                                  initialRating: _.listUlasan[index].bintang ?? 0,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  itemSize: 24,
                                  // itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 10,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const Center(child: Text('')),
            ],
          ),
        ),
      ),
    );
  }
}
