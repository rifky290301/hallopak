import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_gradients.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/dialog/app_bottom_sheet.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
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
              AppHeader.appText('Profil'),
              Center(
                child: GetBuilder<ProfileController>(
                  id: 'image',
                  builder: (_) {
                    return Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: CachedNetworkImageProvider(
                            _.profile?.profile ??
                                'https://www.pngitem.com/pimgs/m/130-1300344_user-symbol-png-transparent-png.png',
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: AppGradients.primary,
                            border: const Border.fromBorderSide(
                              BorderSide(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20),
                            // onPressed: () => controller.pickImageSource(ImageSource.camera),
                            onPressed: () async {
                              ImageSource? source = await buildBottomSheetCustom(context);
                              if (source != null) controller.pickImageSource(source);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSize.medium),
              GetBuilder<ProfileController>(
                id: 'name',
                builder: (_) {
                  return Center(
                    child: Text(
                      _.profile?.nama ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSize.medium),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Get.toNamed(Routes.EDIT_PROFILE, arguments: controller.profile),
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.medium),
                            topRight: Radius.circular(AppSize.medium),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: AppSize.micro),
                              padding: const EdgeInsets.all(AppSize.small),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(AppSize.small),
                              ),
                              child: ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) => AppGradients.primary.createShader(bounds),
                                child: const Icon(Icons.person, size: AppSize.medium, color: Colors.white),
                              ),
                            ),
                            Text(
                              'Akun Saya',
                              style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => controller.logout(),
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.medium),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppSize.medium),
                            topRight: Radius.circular(AppSize.medium),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: AppSize.micro),
                              padding: const EdgeInsets.all(AppSize.small),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE2E4),
                                borderRadius: BorderRadius.circular(AppSize.small),
                              ),
                              child: const Icon(Icons.logout_rounded, size: AppSize.medium, color: Color(0xFFFD3C4A)),
                            ),
                            Text(
                              'Keluar',
                              style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Center(child: Text(' ')),
            ],
          ),
        ),
      ),
    );
  }
}
