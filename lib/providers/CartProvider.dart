import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> cart = [];

  final date = TimeOfDay.now();
  final firebaseDate = DateFormat();
  final currentDate = Timestamp.now();

  addToCart(Map<String, dynamic> product) {
    cart.add(product);
    notifyListeners();
  }

  placeOrder() async {
    await FirebaseFirestore.instance.collection('orders').add({
      'date': currentDate,
      'ordine': cart,
    });
  }

  clearCart() {
    cart.clear();
  }
}
