import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_wrap_icon.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: AppSize.largest, left: AppSize.semiLarge, right: AppSize.semiLarge),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image/bg_login2.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome to \nHallopak',
                  style: AppTextStyle.textBold.copyWith(fontSize: 28),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppWrapIcon.appWrapIcon(Icons.notifications_none_rounded, Routes.NOTIFICATION),
                      const SizedBox(width: AppSize.small),
                      AppWrapIcon.appWrapIcon(Icons.person_outline_rounded, Routes.PROFILE),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GetBuilder<HomeController>(
                  init: controller,
                  builder: (_) {
                    return Text(
                      controller.profileModel?.nama ?? '',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: AppSize.semiLarge),
            GetBuilder<HomeController>(
              init: controller,
              builder: (_) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: controller.iconList.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 1.0,
                      mainAxisSpacing: AppSize.medium,
                      crossAxisSpacing: AppSize.medium,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (controller.titleList[index] == 'Pengaduan') {
                            Get.toNamed(Routes.COMPLAINT);
                          } else if (controller.titleList[index] == 'Chat') {
                            Get.toNamed(Routes.CHAT);
                          } else if (controller.titleList[index] == 'Cari Satpam') {
                            Get.toNamed(Routes.CARI_SATPAM);
                          }
                        },
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
                              controller.iconList[index],
                              Text(
                                controller.titleList[index],
                                style: AppTextStyle.textMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
