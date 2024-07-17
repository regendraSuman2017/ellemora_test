import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  ////////////////UbiSchool/////////////
  Future<Response> getAllProductsRequest();
  Future<Response> getSelectProductsRequest(int id);

}
