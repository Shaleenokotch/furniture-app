import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/productmodel.dart';

Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      'https://5f210aa9daa42f001666535e.mockapi.io/api/products';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Product> products = (jsonDecode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return products;
  }else{
    throw Exception('Failed to load');
  }
}
