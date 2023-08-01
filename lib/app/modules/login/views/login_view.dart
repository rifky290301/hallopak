import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/image/bg_login2.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.1,
              ),
              Image.asset(
                'assets/images/logo/logo_hallopak.png',
                width: 200,
              ),
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: controller.emailTEC!,
                      hintText: 'Email',
                      paddingTop: AppSize.semiLarge,
                      validator: FormValidator.email,
                    ),
                    GetBuilder<LoginController>(
                      init: controller,
                      builder: (_) {
                        return AppTextFormField(
                          controller: controller.passwordTEC!,
                          hintText: 'Password',
                          validator: FormValidator.commonString,
                          textInputAction: TextInputAction.send,
                          paddingTop: AppSize.small,
                          paddingBottom: AppSize.micro,
                          obscureText: controller.isPassword,
                          suffix: IconButton(
                            icon: Icon(
                              controller.isPassword ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.textDisable,
                            ),
                            onPressed: () {
                              controller.isPassword = !controller.isPassword;
                              controller.update();
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: AppSize.largest),
                    AppButton(
                      text: 'Login',
                      onPressed: () {
                        if (loginKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                child: Text(
                  'Belum punya akun? Daftar disini',
                  style: AppTextStyle.textMedium.copyWith(color: AppColors.primary),
                ),
                onPressed: () {
                  Get.toNamed(Routes.REGISTER);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
