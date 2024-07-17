

import 'package:almora_test/data/model/get_select_product_response.dart';
import 'package:almora_test/data/model/getAllProduct_response.dart';

abstract class HomeRepo{
  Future<List<GetAllProductResponse>?> getAllProductsAPI();
  Future<GetSelectProductResponse?> getSelectProductsAPI(int id);

}