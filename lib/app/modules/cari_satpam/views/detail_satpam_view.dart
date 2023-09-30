import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/modules/cari_satpam/controllers/detail_satpam_controller.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_see_list.dart';

import 'lihat_sertifikat_view.dart';

class DetailSatpamView extends GetView<DetailSatpamController> {
  DetailSatpamView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(DetailSatpamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: GetBuilder<DetailSatpamController>(
            id: 'detail',
            init: controller,
            builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppHeader.appBack,
                    AppHeader.appText('Detail Satpam'),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: AppSize.medium, right: AppSize.medium, bottom: AppSize.medium),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.semiSmall),
                              child: CachedNetworkImage(
                                imageUrl: _.profile?.profile ?? '',
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(color: AppColors.primary),
                                ),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.medium),
                          AppSeeList(name: 'Nama', value: _.profile?.nama ?? ''),
                          // Text(_.profile?.nama ?? '', style: AppTextStyle.textMedium.copyWith(fontSize: 24)),
                          const SizedBox(height: AppSize.medium),
                          // Text(_.profile?.alamat ?? '', style: AppTextStyle.textMedium.copyWith(fontSize: 16)),
                          AppSeeList(name: 'Alamat', value: _.profile?.alamat ?? ''),
                          const SizedBox(height: AppSize.medium),
                          AppSeeList(name: 'Pendidikan', value: _.profile?.pendidikanTerakhir ?? ''),
                          const SizedBox(height: AppSize.medium),
                          AppSeeList(name: 'Status', value: _.profile?.status ?? ''),
                          const SizedBox(height: AppSize.medium),
                          Text('Sertifikat', style: AppTextStyle.textMedium.copyWith(fontSize: 16)),
                          const SizedBox(height: AppSize.small),
                          InkWell(
                            onTap: () => Get.to(() => LihatSertifikatView(image: _.profile!.sertifikat!)),
                            child: SizedBox(
                              height: 300,
                              width: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(AppSize.semiSmall),
                                child: CachedNetworkImage(
                                  imageUrl: _.profile?.sertifikat ?? '',
                                  // height: 200,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(color: AppColors.primary),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.small),
                          RatingBar.builder(
                            initialRating: _.ulasan?.bintang ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemSize: 32,
                            // itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 10,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(height: AppSize.small),
                          Text('Ulasan', style: AppTextStyle.textMedium.copyWith(fontSize: 16)),
                          const SizedBox(height: AppSize.small),
                          Text(_.ulasan?.saran ?? '', style: AppTextStyle.textMedium),

                          const SizedBox(height: AppSize.medium),
                          AppButton(text: 'Chat Satpam', onPressed: () => _.connectChat()),
                        ],
                      ),
                    ),

                    // const Spacer(),
                    const Center(child: Text('')),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
