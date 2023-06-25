import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Orders.dart';
import '../models/Product.dart';

class CartProvider extends ChangeNotifier {
  String? message;

  List<Orders> cart = [];

  // cart = [
  //   {
  // 'Vendor': 'RovenCarta',
  // 'email': 'RovenCartaEmail',
  // 'message': '',
  // 'products': [],
  //   },
  // ];

  final date = TimeOfDay.now();
  final firebaseDate = DateFormat();
  final currentDate = Timestamp.now();

  addToCart(Orders order, Product product) async {
    final user = await FirebaseAuth.instance.currentUser!.email;
    final collection =
        user == 'banco.oldsquare@gmail.com' ? 'barVendors' : 'vendors';
    String? vendorEmail;

    await FirebaseFirestore.instance
        .collection(collection)
        .where('vendor', isEqualTo: product.vendor)
        .get()
        .then((QuerySnapshot doc) => vendorEmail = doc.docs[0]['email']);

    if (cart.isNotEmpty) {
      bool exist = false;
      for (var prod in cart) {
        if (prod.vendor == order.vendor) {
          exist = true;
          if (exist) {
            prod.products!.add(product);
            break;
          }
        }
      }
      if (!exist) {
        order
          ..email = vendorEmail
          ..message = ''
          ..products = [product];
        cart.add(order);
      }
    } else {
      order
        ..email = vendorEmail
        ..message = ''
        ..products = [product];
      cart.add(order);
    }
    print(cart);
    notifyListeners();
  }

  placeOrder() async {
    final user = await FirebaseAuth.instance.currentUser!.email;
    final collection =
        user == 'bar.oldsquare@gmail.com' ? 'barOrders' : 'orders';
    List order = [];
    for (var element in cart) {
      for (var prod in element.products!) {
        Map<String, dynamic> product = {
          'name': prod.name,
          'price': prod.price,
          'vendor': prod.vendor,
          'type': prod.type,
          'quantity': prod.quantity,
        };
        order.add(product);
      }
    }
    await FirebaseFirestore.instance.collection(collection).add({
      'date': currentDate,
      'ordine': order,
    });
  }

  clearCart() {
    cart.clear();
  }
}
