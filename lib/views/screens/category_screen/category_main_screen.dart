import 'package:delowarhossain/controllers/category_controller.dart';
import 'package:delowarhossain/views/global_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/landing_page_controller.dart';
import '../../../util/custom_theme.dart';
import '../landing_page/components/category_card.dart';

class CategoryMainScreen extends StatefulWidget {
  const CategoryMainScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  final controller = Get.find<CategoryController>();

  double selectedElevation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/top_dot.png',
                      height: 20,
                      width: 20,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'X',
                              style: CustomTheme.headline1
                                  .copyWith(color: darkText)),
                          TextSpan(
                              text: 'E',
                              style: CustomTheme.headline1
                                  .copyWith(color: lightText))
                        ]),
                      ),
                    ),
                    Icon(Icons.search, color: blackColor),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Our Product', style: CustomTheme.headline1),
                    const Spacer(),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        items: ['Ascending', 'Descending'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: blackColor),
                            ),
                          );
                        }).toList(),
                        isDense: true,
                        hint: const Text('Sort by',
                            style: TextStyle(color: greyColor)),
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.categoriesList.length,
                    itemBuilder: (context, index) {
                      final title = controller.categoriesList[index];

                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0, bottom: 20),
                        child: Container(
                          // height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: whiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 3,
                                blurRadius: 1,
                                offset: const Offset(
                                    0, 7), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '${title[0].toUpperCase()}${title.substring(1)}',
                                style: CustomTheme.subtitle,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : OrientationBuilder(
                          builder: (context, orientation) => GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          (orientation == Orientation.portrait)
                                              ? 2
                                              : 4,
                                      mainAxisExtent: 300),
                              itemCount: controller.categoryWiseProductList.length,
                              itemBuilder: (context, index) =>
                                  ProductCard(
                                    image: controller.categoryWiseProductList[index].image,
                                  )),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
