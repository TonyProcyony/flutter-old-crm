import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget(
      this.productPrice, this.productTitle, this.productVendor,
      {super.key});
  final String productTitle;
  final double productPrice;
  final String productVendor;
  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      width: size.width,
      padding: const EdgeInsets.all(20),
      color: Colors.black.withOpacity(0.5),
      child: Card(
        margin: const EdgeInsets.all(30),
        elevation: 3,
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.productTitle),
            Text(widget.productPrice.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      if (_counter <= 0) {
                        return;
                      }
                      setState(() {
                        _counter--;
                      });
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_counter.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _counter++;
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (_counter <= 0) {
                    return;
                  }
                  Map<String, dynamic>? _product = {
                    'name': widget.productTitle,
                    'price': widget.productPrice,
                    'vendor': widget.productVendor,
                    'quantity': _counter,
                  };
                  await cartProvider.addToCart(_product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      duration: const Duration(seconds: 2),
                      elevation: 3,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      content: const Text('Prodotto aggiunto'),
                    ),
                  );
                  Navigator.of(context).pop();
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Aggiungi al carrello'),
            ),
          ],
        ),
      ),
    );
  }
}
