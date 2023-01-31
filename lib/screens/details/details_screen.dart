import 'package:flutter/material.dart';
import 'package:furniture/models/productmodel.dart';
import 'package:furniture/utils/constants.dart';
import 'package:furniture/utils/size_config.dart';

import 'components/details_body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_outlined, color: Colors.black,), onPressed: (){
          Navigator.pop(context);
        }),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black,)),
          SizedBox(width: SizeConfig.defaultSize,)
        ],
      ),
      body: DetailsBody(product: product,),
    );
  }
}
