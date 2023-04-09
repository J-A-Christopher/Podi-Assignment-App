import 'dart:ui';

class Product {
  final String id;
  final String img;
  final String title;
  final double amount;
  final Color color;
  bool isFavourite;
  Product(
      {required this.id,
      required this.color,
      required this.amount,
      required this.img,
      this.isFavourite = false,
      required this.title});

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
  }
}
