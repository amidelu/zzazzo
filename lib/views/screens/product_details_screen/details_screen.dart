import 'package:delowarhossain/controllers/product_controller.dart';
import 'package:delowarhossain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../../util/custom_theme.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final sizeList = ['US 6', 'US 7', 'US 8', 'US 9'];

  final colorList = [Colors.cyan, Colors.amber, Colors.red, Colors.pinkAccent];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () => controller.isProductLoading.value
                ? SizedBox(
                    height: height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 40.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Image.asset(
                                    'assets/images/back.png',
                                    height: 20,
                                    width: 20,
                                  ),
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
                                const Icon(Icons.search, color: blackColor),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.cyan,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '30%',
                                  style: CustomTheme.subtitle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.hardEdge,
                              children: [
                                Container(
                                  height: 350,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: lightGreyColor)),
                                ),
                                Positioned(
                                  top: 30,
                                  left: 0,
                                  right: 0,
                                  bottom: 30,
                                  child: Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: lightGreyColor)),
                                  ),
                                ),
                                SimpleShadow(
                                  child: Image.network(
                                    controller.product.value.image.toString(),
                                    height: 200,
                                    width: 200,
                                  ),
                                  opacity: 0.6,
                                  // Default: 0.5
                                  color: Colors.black,
                                  // Default: Black
                                  offset: const Offset(5, 5),
                                  // Default: Offset(2, 2)
                                  sigma: 7,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 30.0),
                        decoration: BoxDecoration(
                          color: lightGreyColor.withOpacity(.3),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    controller.product.value.title ?? '',
                                    style: CustomTheme.headline
                                        .copyWith(color: darkText),
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                            '(${controller.product.value.rating?.rate.toString()})')
                                      ],
                                    ))
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(controller.product.value.description ?? '',
                                style: CustomTheme.body1),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Size:',
                                    style: CustomTheme.title
                                        .copyWith(color: greyColor)),
                                const SizedBox(width: 20),
                                SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: sizeList.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: index == 0
                                                    ? sizeColor
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                              child: Text(
                                                sizeList[index],
                                                style: CustomTheme.subtitle,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Available color:',
                                    style: CustomTheme.title
                                        .copyWith(color: greyColor)),
                                const SizedBox(width: 20),
                                SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: colorList.length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            margin: const EdgeInsets.only(
                                                right: 20),
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: colorList[index],
                                                shape: BoxShape.circle),
                                          )),
                                )
                              ],
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                      Container(
                        color: lightGreyColor.withOpacity(.3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 30.0),
                          height: 100,
                          decoration: const BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${controller.product.value.price.toString()}',
                                style: CustomTheme.headline,
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              lightGreyColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25)))),
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.shopping_cart,
                                        color: blackColor,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Add to card',
                                        style: TextStyle(color: blackColor),
                                      )
                                    ],
                                  ))
                            ],
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
