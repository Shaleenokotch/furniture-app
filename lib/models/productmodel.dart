class Product {
  final int price;
  final String id, title, category, image, subtitle, description;

  Product(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.subtitle,
      required this.title});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        category: json['category'],
        description: json['description'],
        id: json['id'],
        image: json['image'],
        price: json['price'],
        subtitle: json['subTitle'],
        title: json['title']);
  }
}
