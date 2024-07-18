import 'dart:async';

import 'package:almora_test/data/home/home_repo.dart';
import 'package:almora_test/data/home/home_repo_impl.dart';
import 'package:almora_test/data/model/get_select_product_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  late HomeRepo _homeRepo;

  ProductDetailController() {
    _homeRepo = Get.find<HomeRepoImpl>();
  }


  var isInCart = false.obs;
  var isInWishList = false.obs;

  List<Map<String, dynamic>> cartItem = [];
  // Method to add product to cart




  void addToWishList() {
    isInWishList.value = true;
  }

  Stream<GetSelectProductResponse>? productsStream;
  StreamController<GetSelectProductResponse> _streamController = StreamController.broadcast();


  TextEditingController searchText = TextEditingController();

  RxBool isLoading = false.obs;

  RxString id=''.obs;
  RxString title=''.obs;
  RxString imageUrl=''.obs;
  RxString description=''.obs;
  RxString price=''.obs;
  @override
  void onInit() async{
    super.onInit();

    dynamic args = Get.arguments;
    final int id = await args[0]['id'];
    productsStream = _streamController.stream;
    getSelectProducts(id);


  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> getSelectProducts(int id) async {
    isLoading.value = true;
    try {
      final response = await _homeRepo.getSelectProductsAPI(id);
      if (response != null) {



       title.value = response.title!;
       imageUrl.value = response.image!;
       description.value = response.description!;
       price.value = response.price.toString();

      } else {
        _streamController.sink.addError("No products available.");
      }
    } catch (e) {

      _streamController.sink.addError("Failed to fetch products");
      Get.snackbar(
        "Failed",
        "Failed to fetch products",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0x00ffef53),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
