import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartProvider extends ChangeNotifier {
  String? message;
  List<Map<String, dynamic>> cart = [];

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

  addToCart(Map<String, dynamic> product) async {
    String? vendorEmail;
    await FirebaseFirestore.instance
        .collection('vendors')
        .where('vendor', isEqualTo: product['vendor'])
        .get()
        .then((QuerySnapshot doc) => vendorEmail = doc.docs[0]['email']);
    print(vendorEmail);
    if (cart.isNotEmpty) {
      bool exist = false;
      for (var prod in cart) {
        if (prod['vendor'] == product['vendor']) {
          exist = true;
          if (exist) {
            prod['products'].add(product);
            break;
          }
        }
      }
      if (!exist) {
        cart.add({
          'vendor': product['vendor'],
          'email': vendorEmail,
          'message': '',
          'products': [product],
        });
      }
    } else {
      cart.add({
        'vendor': product['vendor'],
        'email': vendorEmail,
        'message': '',
        'products': [product],
      });
    }
    notifyListeners();
  }

  placeOrder() async {
    List order = [];
    for (var element in cart) {
      for (var products in element['products']) {
        order.add(products);
      }
    }
    await FirebaseFirestore.instance.collection('orders').add({
      'date': currentDate,
      'ordine': order,
    });
  }

  clearCart() {
    cart.clear();
  }
}

// void main() {
//   List<Map<String, dynamic>> cart = [];

//   Map<String, dynamic>? product1 = {
//                     'name': 'Carta forno',
//                     'price': 2.2,
//                     'vendor': "Roven carta",
//                     'quantity': 1,
//                   };

//   Map<String, dynamic>? product2 = {
//                     'name': 'Tissu',
//                     'price': 1.79,
//                     'vendor': "Roven carta",
//                     'quantity': 3,
//                   };

//   Map<String, dynamic>? product3 = {
//                     'name': "Cannucce",
//                     'price': 0.6,
//                     'vendor': 'Cannucce vendor',
//                     'quantity': 4,
//                   };
//   cart.clear();
//   print(cart);

// //   функція яка примає параметр (продукт), перевіряє чи є об'єкт в списку з таким самим постачальником
// //   як і постачальник продукту. у випадку правди просто додається продукт до списку продуктів цього
// //   постачальника, якшо ні то створюється новий об'єкт

//   addProduct(Map<String,dynamic> prod) {
//     if(cart.isNotEmpty) {
// //       print("Cart is not empty: ${cart.isNotEmpty}");
//       bool exist = false;
//       for(var product in cart) {
//        if(product['vendor'] == prod['vendor']) {
//          exist = true;
//          if (exist) {
//            product['products'].add(prod);
//            break;
//          }
//        }
//       }
//       if (!exist) {
//           cart.add({
//           'vendor': prod['vendor'],
//           'email': 'TestEmail',
//           'message': '',
//           'products': [prod],
//           });
//         }
//     } else {
//       cart.add({
//       'vendor': prod['vendor'],
//       'email': 'ProductDoesn\'tExistEmail',
//       'message': '',
//       'products': [prod],
//       });
//     }
//   }

//   addProduct(product1);
//   print("Added product1");
//   addProduct(product2);
//   print("Added product2");
//   addProduct(product3);
//   print("Added product3");

//   print(cart);

// //   print(cart);
// }