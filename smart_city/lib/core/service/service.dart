import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../main.dart';

class AppServeces extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<AppServeces> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initailServuces() async {
  await Get.putAsync(() => AppServeces().init());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
}
