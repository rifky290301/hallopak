import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
              Expanded(
                child: GridView.builder(
                  itemCount: 12,
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
                      onTap: () => Get.to(() => const DetailSatpamView()),
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
                              child: Image.asset(
                                'assets/images/image/photo_profile.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Text(
                              'Satpam',
                              style: AppTextStyle.textMedium,
                            ),
                          ],
                        ),
                      ),
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
