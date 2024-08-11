import 'package:eye_on_palestine/core/localization/locale_controller.dart';
import 'package:eye_on_palestine/core/localization/translition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eye_on_palestine/core/constants/app_colors.dart';
import 'package:eye_on_palestine/my_binding.dart';
import 'package:eye_on_palestine/routes.dart';
import 'package:eye_on_palestine/core/services/my_servises.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: localeController.language,
      translations: MyTranslation(),
      theme: ThemeData(
        fontFamily: "ReadexPro",
        primaryColor: AppColor.buttonColor,
        primarySwatch: const MaterialColor(
          0xffC61414,
          {
            50: Color(0xFFF8E3E3),
            100: Color(0xFFEEB9B9),
            200: Color(0xFFE38A8A),
            300: Color(0xFFD75B5B),
            400: Color(0xFFCF3737),
            500: Color(0xffC61414),
            600: Color(0xFFC01212),
            700: Color(0xFFB90E0E),
            800: Color(0xFFB10B0B),
            900: Color(0xFFA40606),
          },
        ),
      ),
      getPages: routs,
      initialBinding: MyBinding(),
    );
  }
}
