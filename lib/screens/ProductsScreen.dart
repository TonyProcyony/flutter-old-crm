import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/widgets/ProductWidget.dart';
import 'package:flutter_old_crm/widgets/SearchWidget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool isVisible = false;
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
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: SearchWidget(),
            ),
            Expanded(
              child: FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection('products').get(),
                  builder: (context, snapshot) {
                    final docs = snapshot.data!.docs;
                    return Stack(
                      children: [
                        GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5,
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() {
                                isVisible = true;
                              }),
                              child: ProductWidget(
                                title: docs[index]['productName'],
                                price:
                                    double.parse(docs[index]['productPrice']),
                              ),
                            );
                          },
                        ),
                        Visibility(
                          visible: isVisible,
                          child: InkWell(
                            onTap: () => setState(() {
                              isVisible = false;
                            }),
                            child: Container(
                              height: size.height,
                              width: size.width,
                              padding: const EdgeInsets.all(20),
                              color: Colors.black.withOpacity(1),
                              child: const Center(
                                child: ProductWidget(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
