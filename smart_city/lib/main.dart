import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city/routes.dart';
import 'package:sizer/sizer.dart';
import 'bindings/inibindings.dart';
import 'core/constant/approutes.dart';
import 'core/localization/translation.dart';
import 'core/service/service.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailServuces();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          initialRoute: AppRoutes.onbaording,
          theme: Get.deviceLocale!.languageCode == "ar"
              ? AppTheme.arabeTheme
              : AppTheme.frEnTheme,
          getPages: getPages,
          locale: Locale('en', 'US'),

          translations: AppTranslation(),
        );

      },
    );
  }
}