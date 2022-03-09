import 'package:delowarhossain/services/remote_services.dart';
import 'package:delowarhossain/util/http_exception.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';
import '../util/custom_theme.dart';

class ProductController extends GetxController {
  final isProductLoading = false.obs;
  final productId = 0.obs;
  
  final allProductList = <ProductModel>[].obs;
  final product = ProductModel().obs;


  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading.value = true;
      await RemoteServices.getAllProducts().then((value) {
        allProductList.value = value;
      });
    } catch (error) {
      Get.defaultDialog(
          title: 'Error from API',
          middleText: 'Something went wrong, please try again later',
          textConfirm: 'Ok',
          confirmTextColor: blackColor,
          onConfirm: () {
            Get.back();
          }
      );
      throw HttpException(error.toString());
    } finally {
      isProductLoading.value = false;
    }
  }

  void getSingleProduct() async {
    try {
      isProductLoading.value = true;
      await RemoteServices.singleProduct(productId.value).then((value) {
        product.value = value;
      });
    } catch (error) {
      Get.defaultDialog(
          title: 'Error from API',
          middleText: 'Something went wrong, please try again later',
          textConfirm: 'Ok',
          confirmTextColor: blackColor,
          onConfirm: () {
            Get.back();
          }
      );
      throw HttpException(error.toString());
    } finally {
      isProductLoading.value = false;
    }
  }
}