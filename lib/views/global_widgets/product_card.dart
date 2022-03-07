import 'package:cached_network_image/cached_network_image.dart';
import 'package:delowarhossain/util/custom_theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.productImage, this.title, this.price})
      : super(key: key);

  final productImage;
  final title;
  final price;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: SizedBox(
          width: width * .6,
          child: Column(
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.only(top: 30),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        imageUrl: productImage,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        width: 150,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
                        ),
                        child: Center(
                          child: Text(
                            '-15%',
                            textAlign: TextAlign.center,
                            style: CustomTheme.body1.copyWith(color: whiteColor),),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(0.95),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: blackColor.withOpacity(.15)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.shopping_cart, color: primaryColor),
                                        Text('Add to cart', style: CustomTheme.subtitle.copyWith(color: primaryColor),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                flex: 2,
                                  child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: blackColor.withOpacity(.15)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6.0),
                                  child: Icon(Icons.favorite_border, color: Colors.pink,),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    title,
                    style: CustomTheme.title,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '\$${price.toString()}  ',
                      style: CustomTheme.title,
                    ),
                    TextSpan(
                      text: '\$${((price * 105) / 100).toStringAsFixed(2)}',
                      style: CustomTheme.subtitle.copyWith(color: greyColor, decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
