import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/inital_binding.dart';
import 'app/data/providers/local_storage.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'firebase_options_dev.dart';
import 'flavors.dart';

Future<void> prepare({Flavor? flavor}) async {
  await Get.put(LocalStorage()).initStorage();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: flavor == Flavor.PRODUCTION
        ? DefaultFirebaseOptions.currentPlatform
        : DefaultFirebaseOptionsDev.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Hallopak",
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFEFEFF),
      ),
    );
  }
}
