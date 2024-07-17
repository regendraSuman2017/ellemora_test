import 'package:almora_test/data/home/home_repo_impl.dart';
import 'package:almora_test/module/home_page/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
Get.put(HomePageController());
  }
}
