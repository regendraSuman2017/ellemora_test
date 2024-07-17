import 'dart:async';
import 'package:almora_test/core/url_constant.dart';
import 'package:almora_test/service/http_service.dart';
import 'package:dio/dio.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;


  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: UrlConstant.baseUrl));
  }


  @override
  Future<Response> getAllProductsRequest() async {
    Response response;
    try {
      response = await _dio.get(UrlConstant.getAllProducts);

    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getSelectProductsRequest(int id) async {
    Response response;
    try {
      response = await _dio.get('${UrlConstant.getAllProducts}/$id');

    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

}
