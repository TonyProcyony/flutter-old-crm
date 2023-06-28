import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = 'addproduct-screen';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  String? productName;
  String? productPrice;
  String? productVendor;
  List<DropdownMenuItem>? vendorsList;
  void submit() async {
    try {
      final isValid = _formKey.currentState!.validate();
      if (isValid) {
        final Map<String, dynamic> product = {
          'productName': productName,
          'productPrice': productPrice,
          'productVendor': productVendor,
        };
        await FirebaseFirestore.instance.collection('products').add(product);
        Navigator.of(context).pop();
      }
    } catch (e) {}
  }

  Future<void> getVendors() async {
    final user = await FirebaseAuth.instance.currentUser!.email;
    final collection =
        user == 'bar.oldsquare@gmail.com' ? 'barVendors' : 'vendors';
    final data = await FirebaseFirestore.instance.collection(collection).get();
    final docs = data.docs;
    final vendors = docs.map((e) {
      return DropdownMenuItem(
        value: e['vendor'],
        child: Text(
          e['vendor'],
        ),
      );
    }).toList();
    setState(() {
      vendorsList = vendors;
    });
  }

  @override
  void initState() {
    super.initState();
    getVendors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      // borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: 'Nome prodotto',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci prodotto';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) => productName = value.trim(),
                  onChanged: (value) => productName = value.trim(),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      // borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: 'Prezzo prodotto',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Inserisci prezzo';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) => productPrice = value.trim(),
                  onChanged: (value) => productPrice = value.trim(),
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    // hintText: 'Inserisci fornitore',
                  ),
                  hint: const Text('Inserisci fornitore'),
                  items: vendorsList,
                  onChanged: (value) {
                    productVendor = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Scegli un fornitore';
                    }
                    return null;
                  },
                  // value: null,
                ),
                // TextFormField(
                //   decoration: InputDecoration(
                //     enabledBorder: UnderlineInputBorder(
                //       // borderRadius: BorderRadius.circular(15),
                //       borderSide: BorderSide(
                //         color: Theme.of(context).colorScheme.primary,
                //         width: 3,
                //       ),
                //     ),
                //     contentPadding: const EdgeInsets.all(5),
                //     hintText: 'Inserisci fornitore',
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Inserisci fornitore';
                //     }
                //     return null;
                //   },
                //   textInputAction: TextInputAction.done,
                //   onFieldSubmitted: (value) {
                //     productVendor = value.trim();
                //     submit();
                //   },
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: const Text('Aggiungi prodotto'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
