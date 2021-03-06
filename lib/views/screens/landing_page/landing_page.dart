import 'dart:math';

import 'package:delowarhossain/controllers/category_controller.dart';
import 'package:delowarhossain/util/custom_theme.dart';
import 'package:delowarhossain/views/global_widgets/all_product_card.dart';
import 'package:delowarhossain/views/screens/category_screen/category_main_screen.dart';
import 'package:delowarhossain/views/screens/landing_page/components/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/product_controller.dart';
import '../product_details_screen/details_screen.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  final catController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final product = controller.allProductList;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Transform.rotate(
                              angle: 160 * pi / 100,
                              child: const Icon(Icons.waving_hand,
                                  color: secondaryColor, size: 35)),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Good Morning',
                                  style: CustomTheme.subtitle
                                      .copyWith(color: greyColor)),
                              const Text(
                                'Nicholas',
                                style: CustomTheme.title,
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/menu.png',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none
                      ),
                      contentPadding: const EdgeInsets.all(22.0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search product you wish...',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Daily Deals', style: CustomTheme.headline),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isProductLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.allProductList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                controller.productId.value = controller.allProductList[index].id!;
                                controller.getSingleProduct();
                                Get.to(() => DetailsScreen());
                              },
                              child: AllProductCard(
                                productImage: product[index].image,
                                title: product[index].title,
                                price: product[index].price,
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
                const Text('Popular Categories', style: CustomTheme.headline),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isProductLoading.value
                      ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Center(child: CircularProgressIndicator()))
                      : SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: catController.categoriesList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                catController.categoryName.value = catController.categoriesList[index];
                                catController.getCategoryWiseProductList();
                                Get.to(() => const CategoryMainScreen());
                              },
                              child: CategoryCard(
                                width: 300.0,
                                title: catController.categoriesList[index],
                              ),
                            ),
                          ),
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
