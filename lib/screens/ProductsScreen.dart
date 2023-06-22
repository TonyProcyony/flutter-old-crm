import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/widgets/ProductsGridWidget.dart';
import 'package:flutter_old_crm/widgets/SearchWidget.dart';

import '../models/Product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? searchKeyword;

  List<Product> loadedProductsList = [];
  List<Product> productsList = [];
  List<Product> filteredList = [];

  Future<void> getProducts() async {
    final user = await FirebaseAuth.instance.currentUser!.email;
    final collection =
        user == 'bar.oldsquare@gmail.com' ? 'barProducts' : 'products';
    final data = await FirebaseFirestore.instance.collection(collection).get();
    final docs = data.docs;
    for (var doc in docs) {
      loadedProductsList.add(Product(
        name: doc['productName'],
        price: double.parse(doc['productPrice']),
        vendor: doc['productVendor'],
      ));
    }
    setState(() {
      productsList = loadedProductsList;
    });
  }

  filterProducts(String query) {
    if (query.isEmpty) {
      // getProducts();
      setState(() {
        loadedProductsList = productsList;
      });
    }
    if (query.isNotEmpty) {
      filteredList = productsList.where((product) {
        final productName = product.name.toString().toLowerCase();
        final productVendor = product.vendor.toString().toLowerCase();
        final input = query.toLowerCase();
        if (productName.contains(input)) {
          return productName.contains(input);
        } else {
          return productVendor.contains(input);
        }
      }).toList();
      setState(() {
        loadedProductsList = filteredList;
      });
    }
  }

  deleteProduct(int index, String docId) async {
    await loadedProductsList.removeAt(index);
    await FirebaseFirestore.instance.collection('products').doc(docId).delete();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // getProducts();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: size.height,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SearchWidget(
                    string: filterProducts,
                  ),
                ),
                ProductsGridWidget(
                  products: loadedProductsList,
                  query: searchKeyword,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
