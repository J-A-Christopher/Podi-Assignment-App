import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _existingProducts = [
    Product(
        id: 'i1',
        img: 'cheese.png',
        title: 'Cheese',
        amount: 12,
        color: Colors.green),
    Product(
        id: 'i2',
        img: 'chocolate-bar.png',
        title: 'Chocolate',
        amount: 20,
        color: Colors.blue),
    Product(
        id: 'i3',
        img: 'fries.png',
        title: 'Fries',
        amount: 18.5,
        color: Colors.amber),
    Product(
        id: 'i4',
        img: 'hamburger.png',
        title: 'Hamburger',
        amount: 15,
        color: Colors.purple),
  ];

  List<Product> get existingProducts {
    return [..._existingProducts];
  }

  Product findById(String id) {
    return _existingProducts.firstWhere((prod) => prod.id == id);
  }

  void toggleStatus(String id) {
    Product currentP = findById(id);
    currentP.toggleFavoriteStatus();
    notifyListeners();
  }
}
