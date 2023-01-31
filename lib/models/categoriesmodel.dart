class Category {
  final String id, title, image;
  final int numOfProducts;

  Category(
      {required this.image,
      required this.id,
      required this.numOfProducts,
      required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        image: json['image'],
        id: json['id'],
        numOfProducts: json['numOfProducts'],
        title: json['title']);
  }
}
