import 'dart:async';

import 'package:almora_test/data/home/home_repo.dart';
import 'package:almora_test/data/home/home_repo_impl.dart';
import 'package:almora_test/data/model/getAllProduct_response.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late HomeRepo _homeRepo;

  HomePageController() {
    _homeRepo = Get.find<HomeRepoImpl>();
  }

  Stream<List<GetAllProductResponse>>? productsStream;
  StreamController<List<GetAllProductResponse>> _streamController = StreamController.broadcast();

  RxList<GetAllProductResponse> getProductList = <GetAllProductResponse>[].obs;
  RxList<GetAllProductResponse> getProductFilterList = <GetAllProductResponse>[].obs;

  TextEditingController searchText = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
    productsStream = _streamController.stream;
    getAllProducts();

  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

/*  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      final response = await _homeRepo.getAllProductsAPI();
      isLoading.value = false;
      if (response != null) {
        getProductList.assignAll(response);
        getProductFilterList.assignAll(response);
      } else {
        getProductList.clear();
        getProductFilterList.clear();
        _streamController.sink.addError("No products available.");
      }
      _streamController.sink.add(getProductList.toList());
      _streamController.sink.add(getProductFilterList.toList());
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
      getProductList.clear();
      getProductFilterList.clear();
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
  }*/

  Future<void> getAllProducts() async {
    isLoading.value = true;
    try {
      final response = await _homeRepo.getAllProductsAPI();
      isLoading.value = false;
      if (response != null) {
        getProductList.assignAll(response);
        getProductFilterList.assignAll(response);
        _streamController.sink.add(getProductFilterList.toList());
      } else {
        getProductList.clear();
        getProductFilterList.clear();
        _streamController.sink.addError("No products available.");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
      getProductList.clear();
      getProductFilterList.clear();
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

/*  void filterProductList(String query) {
    print("askjhdkjsa ${query}");
    if (query.isEmpty) {
      getProductFilterList.assignAll(getProductList);
    } else {
      getProductFilterList.assignAll(
        getProductList.where((product) => product.title!.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }*/
void filterProductList(String query) {
  if (query.isEmpty) {
    getProductFilterList.assignAll(getProductList);
  } else {
    getProductFilterList.assignAll(
      getProductList.where((product) => product.title!.toLowerCase().contains(query.toLowerCase())).toList(),
    );
  }
  _streamController.sink.add(getProductFilterList.toList());
}
}
