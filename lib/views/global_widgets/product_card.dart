import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:delowarhossain/util/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.image, this.title, this.price, this.rating, this.count})
      : super(key: key);

  final image;
  final title;
  final price;
  final rating;
  final count;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
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
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
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
                SimpleShadow(
                  child: Image.network(
                    image,
                    height: 80,
                    width: 80,
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
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTheme.title,
            ),
            const SizedBox(height: 20),
            Text(
              '\$${price.toString()}',
              style: CustomTheme.headline.copyWith(color: primaryColor),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                ),
                Text('(${count.toString()})', style: CustomTheme.body1)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
