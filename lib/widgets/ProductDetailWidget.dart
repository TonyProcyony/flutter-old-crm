import 'package:flutter/material.dart';
import 'package:flutter_old_crm/models/Product.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget(
    this.product, {
    super.key,
    // this.productPrice,
    // this.productTitle,
    // this.productVendor,
  });
  final Product product;
  // final String? productTitle;
  // final double? productPrice;
  // final String? productVendor;
  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  int _counter = 0;

  bool _isCl = false;
  bool _isCt = false;
  bool _isPezzi = false;
  bool _isKg = false;
  bool _isBt = false;
  bool _isFt = false;

  String? type;

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
            Text(widget.product.name!),
            Text('Prezzo per unità ${widget.product.price.toString()}'),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 3,
              children: [
                ChoiceChip(
                  label: const Text('Ct'),
                  selected: _isCt,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isCt = value;
                    });
                    type = 'Ct';
                  },
                ),
                ChoiceChip(
                  label: const Text('Cl'),
                  selected: _isCl,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isCl = value;
                    });
                    type = 'Cl';
                  },
                ),
                ChoiceChip(
                  label: const Text('Pezzi'),
                  selected: _isPezzi,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isPezzi = value;
                    });
                    type = 'Pezzi';
                  },
                ),
                ChoiceChip(
                  label: const Text('Kg'),
                  selected: _isKg,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isKg = value;
                    });
                    type = 'Kg';
                  },
                ),
                ChoiceChip(
                  label: const Text('Bt'),
                  selected: _isBt,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isBt = value;
                    });
                    type = 'Bt';
                  },
                ),
                ChoiceChip(
                  label: const Text('Ft'),
                  selected: _isFt,
                  selectedColor: Theme.of(context).primaryColor,
                  onSelected: (value) {
                    setState(() {
                      _isFt = value;
                    });
                    type = 'Ft';
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  hintText: 'Inserisci la quantità',
                ),
                onChanged: (value) => _counter = int.parse(value),
                textAlign: TextAlign.center,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: IconButton(
            //         onPressed: () {
            //           if (_counter <= 0) {
            //             return;
            //           }
            //           setState(() {
            //             _counter--;
            //           });
            //         },
            //         icon: const Icon(
            //           Icons.remove,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(_counter.toString()),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: IconButton(
            //         onPressed: () {
            //           setState(() {
            //             _counter++;
            //           });
            //         },
            //         icon: const Icon(
            //           Icons.add,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (_counter <= 0) {
                    return;
                  }
                  // final _product = Product(
                  //   name: widget.productTitle,
                  //   price: widget.productPrice,
                  //   vendor: widget.productVendor,
                  //   type: type,
                  //   quantity: _counter,
                  // );
                  // Map<String, dynamic>? _product = {
                  //   'name': widget.product.name,
                  //   'price': widget.product.price,
                  //   'vendor': widget.product.vendor,
                  //   'type': type,
                  //   'quantity': _counter,
                  // };
                  Product product = Product()
                    ..name = widget.product.name
                    ..price = widget.product.price
                    ..vendor = widget.product.vendor
                    ..type = type
                    ..quantity = _counter;
                  await cartProvider.addToCart(product);
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
