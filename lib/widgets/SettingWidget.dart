import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({super.key, this.text, this.route});

  final String? text;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(route!),
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(45, 45, 45, 1),
                Color.fromRGBO(25, 25, 25, 1),
              ]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(text!),
        ),
      ),
    );
  }
}
