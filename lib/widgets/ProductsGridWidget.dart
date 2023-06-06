import 'package:flutter/material.dart';

import 'ProductWidget.dart';

class ProductsGridWidget extends StatefulWidget {
  const ProductsGridWidget({super.key, this.products, this.query});

  final List? products;
  final String? query;

  @override
  State<ProductsGridWidget> createState() => _ProductsGridWidgetState();
}

class _ProductsGridWidgetState extends State<ProductsGridWidget> {
  void filter(String q) async {}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: widget.products!.length,
        itemBuilder: (context, index) {
          return ProductWidget(
            widget.products![index]['productName'],
            double.parse(widget.products![index]['productPrice']),
            widget.products![index]['productVendor'],
            widget.products![index].id,
          );
        },
      ),
    );
  }
}
