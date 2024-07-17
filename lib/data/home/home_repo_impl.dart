import 'dart:convert';
import 'package:almora_test/data/home/home_repo.dart';
import 'package:almora_test/data/model/get_select_product_response.dart';
import 'package:almora_test/data/model/getAllProduct_response.dart';
import 'package:almora_test/service/http_service.dart';
import 'package:almora_test/service/http_service_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeRepoImpl implements HomeRepo {

late  HttpService _httpService;
  HomeRepoImpl(){
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

@override
  Future<List<GetAllProductResponse>?> getAllProductsAPI() async {
  try {
    final response = await _httpService.getAllProductsRequest();
    return getAllProductResponseFromJson(jsonEncode(response.data));
  } on Exception catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
List<GetAllProductResponse> getAllProductResponseFromJson(String str) => List<GetAllProductResponse>.from(json.decode(str).map((x) => GetAllProductResponse.fromJson(x)));



@override
Future<GetSelectProductResponse?> getSelectProductsAPI(int id) async{
  try {
    final response = await _httpService.getSelectProductsRequest(id);
    Map<String, dynamic> responseMap = Map.from(jsonDecode(response.toString()));
    return GetSelectProductResponse.fromJson(responseMap);
  } on Exception catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return null;
  }
}

}