import 'package:almora_test/data/home/home_repo_impl.dart';
import 'package:almora_test/module/splash/splash_controller.dart';
import 'package:get/get.dart';
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
    Get.put(SplashController());
  }
}
