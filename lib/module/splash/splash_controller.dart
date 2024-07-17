

import 'dart:async';
import 'package:almora_test/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {

  RxString qrResponse = '0'.obs;


  @override
  Future<void> onReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  bool checkLogin = prefs.getBool('isLogin')??false;

    Timer(const Duration(seconds: 2), () async{
      (checkLogin==true)
          ? Get.offAllNamed(Routes.homeScreen)
          : Get.offAllNamed(Routes.loginScreen);
    });
    super.onReady();
  }



}