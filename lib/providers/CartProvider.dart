import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>>? cart = [];

  CartProvider({this.cart});

  addToCart(Map<String, dynamic> product) {
    cart!.add(product);
    notifyListeners();
  }
}
