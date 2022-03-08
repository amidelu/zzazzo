import 'package:get/get.dart';

import '../model/category_product_model.dart';
import '../services/remote_services.dart';
import '../util/http_exception.dart';

class CategoryController extends GetxController {
  final categoriesList = [].obs;
  final categoryWiseProductList = <CategoryProductModel>[].obs;

  final categoryName = ''.obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    getAllCategories();
    super.onInit();
  }

  void getAllCategories() async {
    try {
      isLoading.value = true;
      await RemoteServices.getAllCategories().then((value) {
        categoriesList.value = value;
      });
    } catch (error) {
      throw HttpException(error.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void getCategoryWiseProductList() async {
    try {
      isLoading.value = true;
      await RemoteServices.categoryWiseProductList(categoryName.value).then((value) {
        categoryWiseProductList.value = value;
      });
    } catch (error) {
      throw HttpException(error.toString());
    } finally {
      isLoading.value = false;
    }
  }
}