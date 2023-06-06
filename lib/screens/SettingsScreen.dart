import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/SettingWidget.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = 'settings-screen';
  const SettingScreen({super.key});

  final List<String>? texts = const [
    'Aggiungi prodotto',
    'Aggiungi fornitore',
  ];

  final List<String>? routes = const [
    'addproduct-screen',
    'addvendor-screen',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: texts!.length,
                itemBuilder: (ctx, index) => SettingWidget(
                  text: texts![index],
                  route: routes![index],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                final provider = Provider.of<GoogleSignInProvider>(context);
                provider.logout();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Esci'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
