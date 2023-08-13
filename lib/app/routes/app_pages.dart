import 'package:get/get.dart';

import '../modules/cari_satpam/bindings/cari_satpam_binding.dart';
import '../modules/cari_satpam/views/cari_satpam_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/conversation/bindings/convertation_binding.dart';
import '../modules/chat/conversation/views/conversation_view.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/complaint/add_complaint/bindings/add_complaint_binding.dart';
import '../modules/complaint/add_complaint/views/add_complaint_view.dart';
import '../modules/complaint/bindings/complaint_binding.dart';
import '../modules/complaint/views/complaint_view.dart';
import '../modules/form_profile/bindings/form_profile_binding.dart';
import '../modules/form_profile/views/form_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/slpash_screen/bindings/slpash_screen_binding.dart';
import '../modules/slpash_screen/views/slpash_screen_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.FORM_PROFILE,
      page: () => const FormProfileView(),
      binding: FormProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.COMPLAINT,
      page: () => const ComplaintView(),
      binding: ComplaintBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_COMPLAINT,
          page: () => const AddComplaintView(),
          binding: AddComplaintBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
      children: [
        GetPage(
          name: _Paths.CONVERTATION,
          page: () => const ConvertationView(),
          binding: ConvertationBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.CARI_SATPAM,
      page: () => const CariSatpamView(),
      binding: CariSatpamBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
