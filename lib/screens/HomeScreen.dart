import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text('Piebar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
