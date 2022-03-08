import 'package:delowarhossain/util/custom_theme.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.title}) : super(key: key);
  final title;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: blackColor,
          image: DecorationImage(
              colorFilter:
              ColorFilter.mode(blackColor.withOpacity(0.5),
                  BlendMode.dstATop),
              image: const AssetImage('assets/images/electronic.jpeg'),
            fit: BoxFit.fitWidth
          )
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                  '${title[0].toUpperCase()}${title.substring(1)}',

                  style: CustomTheme.headline.copyWith(color: whiteColor)),
            )),
      ),
    );
  }
}

extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
