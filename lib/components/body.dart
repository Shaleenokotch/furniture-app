import 'package:flutter/material.dart';
import 'package:furniture/components/productscard.dart';
import 'package:furniture/components/texttitle.dart';
import 'package:furniture/models/categoriesmodel.dart';
import 'package:furniture/screens/details/details_screen.dart';
import 'package:furniture/services/fetchcategories.dart';
import 'package:furniture/services/fetchproducts.dart';
import 'package:furniture/utils/size_config.dart';
import '../models/productmodel.dart';
import 'categorycard.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TextTitle(
              text: 'Browse By Categories',
            ),
          ),
          FutureBuilder(
              future: fetchCategory(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.requireData,
                    )
                  : const CircularProgressIndicator()),
          const Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TextTitle(
              text: 'Recommends for You',
            ),
          ),
          FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommedProducts(product: snapshot.requireData)
                  : const CircularProgressIndicator())
        ],
      ),
    ));
  }
}

class RecommedProducts extends StatelessWidget {
  RecommedProducts({super.key, required this.product});

  final List<Product> product;

  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.693),
        itemBuilder: (context, index) =>
            ProductsCard(product: product[index], press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailsScreen(product: product[index]);
              }));
            }),
        itemCount: product.length,
      ),
    );
  }
}

class Categories extends StatelessWidget {
  Categories({super.key, required this.categories});

  final List<Category> categories;

  final double defaultSize = SizeConfig.defaultSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: EdgeInsets.all(defaultSize * 2),
          child: Row(
            children: List.generate(categories.length,
                (index) => CategoryCard(category: categories[index])),
          )),
    );
  }
}
