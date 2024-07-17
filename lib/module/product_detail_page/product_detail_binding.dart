import 'package:almora_test/data/home/home_repo_impl.dart';
import 'package:almora_test/module/product_detail_page/product_detail_controller.dart';
import 'package:get/get.dart';

class ProductDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeRepoImpl());
Get.put(ProductDetailController());
  }
}
