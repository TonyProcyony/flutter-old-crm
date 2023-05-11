import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddVendorScreen extends StatefulWidget {
  static const routeName = 'addvendor-screen';
  const AddVendorScreen({super.key});

  @override
  State<AddVendorScreen> createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends State<AddVendorScreen> {
  final _formKey = GlobalKey<FormState>();
  String? vendor;
  String? email;

  submit() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      await FirebaseFirestore.instance.collection('vendors').add({
        'vendor': vendor,
        'email': email,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: 'Fornitore',
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => vendor = value.trim(),
                  onFieldSubmitted: (value) => vendor = value.trim(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Inserisci il fornitore';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    hintText: 'Email fornitore',
                  ),
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => email = value.trim(),
                  onFieldSubmitted: (value) {
                    email = value.trim();
                    submit();
                  },
                  validator: (value) {
                    if (value!.isEmpty &&
                        value.contains('@') == false &&
                        value.contains('.') == false) {
                      return 'Inserisci la mail del fornitore';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      submit();
                    },
                    child: const Text('Aggiungi fornitore'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
