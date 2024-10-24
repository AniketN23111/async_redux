import 'dart:typed_data';

import 'package:last_step/Constants/response_api.dart';
import 'package:last_step/Model/product_response.dart';

abstract class DataService {
  Future<ResponseApi> getAllProduct();
  Future<ResponseApi> getSingleProduct(ProductResponse productResponse);
  //Future<ResponseApi> uploadProduct(dynamic data);
  Future<ResponseApi> updateProduct(ProductResponse productResponse);
  Future<ResponseApi> deleteProduct(ProductResponse productResponse);
  Future<ResponseApi> uploadFile(Uint8List? fileBytes, String? fileName);
}
