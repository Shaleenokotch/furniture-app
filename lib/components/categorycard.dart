import 'package:flutter/material.dart';
import 'package:furniture/components/texttitle.dart';

import '../models/categoriesmodel.dart';
import '../utils/constants.dart';
import '../utils/size_config.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});

  final double defaultSize = SizeConfig.defaultSize;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultSize * 2),
        child: SizedBox(
          width: defaultSize * 20.5,
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                    aspectRatio: 1.025,
                    child: Container(
                      padding: EdgeInsets.all(defaultSize * 2),
                      color: kSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextTitle(text: category.title),
                          SizedBox(
                            height: defaultSize,
                          ),
                          Text(
                            '${category.numOfProducts}+ Products',
                            style: const TextStyle(color: kTextColor),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 1.15,
                      child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.png',
                          image: category.image),
                    ))
              ],
            ),
          ),
        ));
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSide = 30;

    path.lineTo(0, height - cornerSide);
    path.quadraticBezierTo(0, height, cornerSide, height);
    path.lineTo(width - cornerSide, height);
    path.quadraticBezierTo(width, height, width, height - cornerSide);
    path.lineTo(width, cornerSide);
    path.quadraticBezierTo(width, 0, width - cornerSide, 0);
    path.lineTo(cornerSide, cornerSide * 0.75);
    path.quadraticBezierTo(0, cornerSide, 0, cornerSide * 2);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
