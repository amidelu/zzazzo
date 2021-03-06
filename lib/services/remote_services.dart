import 'dart:convert';

import 'package:delowarhossain/util/http_exception.dart';
import 'package:http/http.dart' as http;

import '../model/category_product_model.dart';
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

  // Getting single products
  static Future<ProductModel> singleProduct(int productId) async {
    final url = baseUrl! + 'products/$productId';

    final response = await client.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      return ProductModel.fromJson(responseBody);
    } else {
      throw HttpException('Error from single product');
    }
  }

  // Category api
  static Future<List> getAllCategories() async {
    final url = baseUrl! + 'products/categories';

    final response = await client.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final responseBody = json.decode(response.body);

      return responseBody;
    } else {
      throw HttpException('error');
    }
  }

  // Category wise product api
  static Future<List<CategoryProductModel>> categoryWiseProductList(String? categoryName) async {
    final url = baseUrl! + 'products/category/$categoryName';

    final response = await client.get(Uri.parse(url));

    if(response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<CategoryProductModel> loadedItem = [];

      for(var product in responseBody) {
        loadedItem.add(CategoryProductModel.fromJson(product));
      }

      return loadedItem;
    } else {
      throw HttpException('Error from all product');
    }
  }
}