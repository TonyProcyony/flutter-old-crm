import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/widgets/ProductDetailWidget.dart';

import '../models/Product.dart';

class ProductWidget extends StatelessWidget {
  ProductWidget(
    this.product, {
    super.key,
    // this.title,
    // this.price,
    // this.vendor,
    this.docId,
  });

  final Product product;
  // final String? title;
  // final double? price;
  // final String? vendor;
  final String? docId;

  String? changedTitle;
  String? changedPrice;
  String? changedVendor;

  static final formKey = GlobalKey<FormState>();

  void changeProduct(BuildContext context) async {
    await FirebaseFirestore.instance.collection('products').doc(docId).update({
      'productName': changedTitle == null ? product.name : changedTitle,
      'productPrice': changedPrice == null ? product.price : changedPrice,
      'productVendor': changedVendor == null ? product.vendor : changedVendor,
    });
    Navigator.of(context).pop();
  }

  void deleteProduct(BuildContext context) async {
    await FirebaseFirestore.instance.collection('products').doc(docId).delete();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
        context: context,
        builder: (context) => ProductDetailWidget(product),
      ),
      onLongPress: () => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        initialValue: product.name,
                        onChanged: (value) => changedTitle = value.trim(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        initialValue: product.price.toString(),
                        onChanged: (value) => changedPrice = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                        initialValue: product.vendor,
                        onChanged: (value) => changedVendor = value.trim(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () => changeProduct(context),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Conferma'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton.icon(
                        onPressed: () => deleteProduct(context),
                        style: Theme.of(context)
                            .elevatedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.red),
                            ),
                        label: const Text("Elimina"),
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      child: Card(
        elevation: 1,
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                product.name!,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            Text(
              '${product.price.toString()}€',
            ),
          ],
        ),
      ),
    );
  }
}
