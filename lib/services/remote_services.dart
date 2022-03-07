import 'dart:convert';

import 'package:delowarhossain/util/http_exception.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class RemoteServices {
  static var client = http.Client();
  static String? baseUrl = 'https://fakestoreapi.com/';

  // Getting all products
  static Future<List<ProductModel>> getAllProducts() async {
    final url = baseUrl! + 'products';

    final response = await client.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<ProductModel> loadedItem = [];
      for(var product in responseBody) {
        loadedItem.add(ProductModel.fromJson(product));
      }
      return loadedItem;
    } else {
      throw HttpException('Error from all product');
    }
}
}