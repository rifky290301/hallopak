import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';

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
              Container(
                padding: const EdgeInsets.only(left: AppSize.medium, right: AppSize.medium, bottom: AppSize.medium),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Satpam',
                    hintStyle: AppTextStyle.textMedium.copyWith(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.semiSmall),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.semiSmall),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.semiSmall),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GetBuilder<CariSatpamController>(
                  id: 'list',
                  init: controller,
                  builder: (_) {
                    if (_.users.isEmpty) {
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
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSize.medium,
                        crossAxisSpacing: AppSize.medium,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(
                            () => DetailSatpamView(),
                            arguments: [_.profiles[index], _.users[index]],
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(AppSize.semiSmall),
                                  // child: Image.network(
                                  //   _.profiles[index].profile ?? '',
                                  //   height: 100,
                                  //   width: 100,
                                  // ),
                                  child: CachedNetworkImage(
                                    imageUrl: _.profiles[index].profile ?? '',
                                    height: 100,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(color: AppColors.primary),
                                    ),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: AppSize.micro),
                                Text(
                                  _.profiles[index].nama ?? '',
                                  style: AppTextStyle.textMedium,
                                  overflow: TextOverflow.ellipsis,
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
