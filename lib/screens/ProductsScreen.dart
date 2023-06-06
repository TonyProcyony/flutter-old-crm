import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/widgets/ProductsGridWidget.dart';
import 'package:flutter_old_crm/widgets/SearchWidget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String? searchKeyword;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> loadedProductsList = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> productsList = [];
  List<QueryDocumentSnapshot<Map<String, dynamic>>> filteredList = [];

  Future<void> getProducts() async {
    final data = await FirebaseFirestore.instance.collection('products').get();
    final docs = data.docs;
    setState(() {
      loadedProductsList = docs;
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
        final productName = product['productName'].toString().toLowerCase();
        final input = query.toLowerCase();
        return productName.contains(input);
      }).toList();
      setState(() {
        loadedProductsList = filteredList;
      });
    }
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
