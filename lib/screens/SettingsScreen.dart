import 'dart:ui';

import 'package:flutter/material.dart';

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
        child: ListView.builder(
          itemCount: texts!.length,
          itemBuilder: (ctx, index) => SettingWidget(
            text: texts![index],
            route: routes![index],
          ),
        ),
      ),
    );
  }
}
