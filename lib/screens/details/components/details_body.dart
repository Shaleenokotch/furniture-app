import 'package:flutter/material.dart';
import 'package:furniture/models/productmodel.dart';
import 'package:furniture/utils/constants.dart';
import 'package:furniture/utils/size_config.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SizedBox(
      width: double.infinity,
      height: SizeConfig.screenHeight - AppBar().preferredSize.height,
      child: Stack(
        children: [
          ProductInfo(product: product),
          Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(product: product)),
          Positioned(
            height: defaultSize * 37.8,
            width: defaultSize * 37.4,
            top: defaultSize * 9.5,
            right: -defaultSize * 3,
            child: Hero(
              tag: product.id,
                child: Image.network(
              product.image,
              fit: BoxFit.cover,
            )),
          )
        ],
      ),
    ));
  }
}

class ProductDescription extends StatelessWidget {
  ProductDescription({
    super.key,
    required this.product,
  });

  double defaultSize = SizeConfig.defaultSize;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
          top: defaultSize * 9, left: defaultSize * 2, right: defaultSize * 2),
      // height: 500,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.2),
              topRight: Radius.circular(defaultSize * 1.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.subtitle,
            style: TextStyle(
                fontSize: defaultSize * 1.8, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          Text(
            product.description,
            style: TextStyle(
                color: kTextColor.withOpacity(
                  0.7,
                ),
                height: 1.5),
          ),
          SizedBox(
            height: defaultSize * 3,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(defaultSize * 1.5)),
              child: Text(
                'Add To Cart',
                style: TextStyle(
                    fontSize: defaultSize * 1.6, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  ProductInfo({
    super.key,
    required this.product,
  });

  double defaultSize = SizeConfig.defaultSize;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
      height: defaultSize * 37.5,
      width: defaultSize * 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            product.category.toUpperCase(),
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          SizedBox(
            height: defaultSize,
          ),
          Text(
            product.title,
            style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text('From', style: TextStyle(color: kTextColor.withOpacity(0.6))),
          Text(
            '\$ ${product.price}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: defaultSize * 1.6,
                height: 1.6),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'Available Colors',
            style: TextStyle(color: kTextColor.withOpacity(0.6)),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
                padding: const EdgeInsets.all(15),
                height: defaultSize * 2.4,
                width: defaultSize * 2.4,
                decoration: const BoxDecoration(color: Color(0xFF7BA275)),
              ),
              Container(
                margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
                padding: const EdgeInsets.all(15),
                height: defaultSize * 2.4,
                width: defaultSize * 2.4,
                decoration: const BoxDecoration(color: Color(0xFFD7D7D7)),
              ),
              Container(
                margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
                padding: const EdgeInsets.all(15),
                height: defaultSize * 2.4,
                width: defaultSize * 2.4,
                decoration: const BoxDecoration(color: kTextColor),
              )
            ],
          )
        ],
      ),
    );
  }
}
