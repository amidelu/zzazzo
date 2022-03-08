import 'package:cached_network_image/cached_network_image.dart';
import 'package:delowarhossain/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.image}) : super(key: key);

  final image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                const Icon(
                  Icons.favorite,
                  color: greyColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                    color: cardHighlightColor, shape: BoxShape.circle),
              ),
              Positioned(
                top: 5,
                left: 0,
                right: 0,
                bottom: 5,
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: whiteColor)),
                ),
              ),
              Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: SimpleShadow(
                  child: Image.network(image, height: 80, width: 80,),
                  opacity: 0.6,
                  // Default: 0.5
                  color: Colors.black,
                  // Default: Black
                  offset: const Offset(5, 5),
                  // Default: Offset(2, 2)
                  sigma: 7,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
