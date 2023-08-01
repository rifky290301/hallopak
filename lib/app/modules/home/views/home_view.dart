import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_gradients.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.logout();
        },
        child: const Icon(Icons.logout),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: AppSize.largest, left: AppSize.semiLarge, right: AppSize.semiLarge),
        decoration: const BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('assets/images/image/bg_appbar.png'),
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
                  style: AppTextStyle.textBold.copyWith(fontSize: 32),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.small),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(20, 788, 90, 0.2),
                        spreadRadius: 0,
                        blurRadius: 50,
                        offset: Offset(11, 28),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => AppGradients.primary.createShader(bounds),
                      child: const Icon(Icons.notifications_none_rounded),
                    ),
                    onPressed: () => Get.toNamed(Routes.NOTIFICATION),
                  ),
                )
              ],
            ),
            const SizedBox(height: AppSize.semiLarge),
            Expanded(
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
                      if (index == 0) {
                        Get.toNamed(Routes.COMPLAINT);
                      } else if (index == 1) {
                        Get.toNamed(Routes.CHAT);
                      } else {
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
            ),
          ],
        ),
      ),
    );
  }
}
