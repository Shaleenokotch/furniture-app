import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:furniture/models/categoriesmodel.dart';

Future<List<Category>> fetchCategory() async {
  const String apiUrl =
      'https://5f210aa9daa42f001666535e.mockapi.io/api/categories';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Category> categories = (jsonDecode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    return categories;
  }else{
    throw Exception('Failed to load');
  }
}
