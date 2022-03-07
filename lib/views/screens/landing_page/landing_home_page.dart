import 'dart:math';

import 'package:delowarhossain/util/custom_theme.dart';
import 'package:delowarhossain/views/global_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/landing_page_controller.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final controller = Get.put(LandingPageController());

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
                      fillColor: lightGreyColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: const EdgeInsets.all(15.0),
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search product you wish...',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Daily Deals', style: CustomTheme.headline),
                const SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.allProductList.length,
                            itemBuilder: (context, index) => ProductCard(
                              productImage: product[index].image,
                              title: product[index].title,
                              price: product[index].price,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
