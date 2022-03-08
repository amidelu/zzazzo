import 'package:delowarhossain/services/remote_services.dart';
import 'package:delowarhossain/util/http_exception.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class LandingPageController extends GetxController {
  final isLoading = false.obs;
  
  final allProductList = <ProductModel>[].obs;


  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading.value = true;
      await RemoteServices.getAllProducts().then((value) {
        allProductList.value = value;
      });
    } catch (error) {
      throw HttpException(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}