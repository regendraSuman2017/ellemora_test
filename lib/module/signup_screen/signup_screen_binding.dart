import 'package:almora_test/module/signup_screen/signup_screen_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpScreenController());
  }

}