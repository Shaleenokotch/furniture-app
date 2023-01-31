import 'package:flutter/material.dart';
import 'package:furniture/components/texttitle.dart';
import 'package:furniture/models/productmodel.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProductsCard extends StatelessWidget {
  ProductsCard({super.key, required this.product, required this.press});

  final Product product;
  final Function press;
  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          width: defaultSize * 14.5,
          decoration: BoxDecoration(
              color: kSecondaryColor, borderRadius: BorderRadius.circular(30)),
          child: AspectRatio(
            aspectRatio: 0.693,
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Hero(
                      tag: product.id,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/placeholder.png',
                        image: product.image,
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultSize),
                  child: TextTitle(text: product.title),
                ),
                SizedBox(
                  height: defaultSize / 2,
                ),
                Text('\$ ${product.price}'),
                const Spacer()
              ],
            ),
          ),
        ));
  }
}
