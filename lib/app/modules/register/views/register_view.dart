import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/constants/app_colors.dart';
import 'package:hallopak/app/themes/constants/app_size.dart';
import 'package:hallopak/app/themes/widgets/app_button.dart';
import 'package:hallopak/app/themes/widgets/app_dropdown_form_field.dart';
import 'package:hallopak/app/themes/widgets/app_text_form_field.dart';
import 'package:hallopak/app/utils/form_validator.dart';

import '../../../themes/extensions/app_text_style.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final registerKey = GlobalKey<FormState>();

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
                key: registerKey,
                child: Column(
                  children: [
                    AppTextFormField(
                      controller: controller.emailTEC!,
                      hintText: 'Email',
                      validator: FormValidator.email,
                      paddingTop: AppSize.semiLarge,
                    ),
                    GetBuilder<RegisterController>(
                      init: controller,
                      builder: (_) {
                        return AppTextFormField(
                          controller: controller.passwordTEC!,
                          hintText: 'Password',
                          textInputAction: TextInputAction.send,
                          paddingTop: AppSize.small,
                          paddingBottom: AppSize.micro,
                          validator: FormValidator.commonString,
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
                    const SizedBox(height: AppSize.micro / 2),
                    AppDropdownFormField(
                      validator: FormValidator.commonString,
                      listItem: const [WARGA, SATPAM],
                      selectedValue: controller.selectedRole,
                      onChanged: (String? newValue) {
                        controller.selectedRole = newValue!;
                      },
                      hintText: 'Pilih Akun',
                    ),
                    const SizedBox(height: AppSize.largest),
                    AppButton(
                      text: 'Register',
                      onPressed: () {
                        if (registerKey.currentState!.validate()) {
                          controller.register();
                        }
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                child: Text(
                  'Sudah punya akun? Login',
                  style: AppTextStyle.textMedium.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  Get.toNamed(Routes.LOGIN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
