import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderDetailScreen extends StatelessWidget {
  static const routeName = 'orderdetail-screen';
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // print(args);
    // print(args['order']['ordine']);
    final order = args['order']['ordine'];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: order.length,
              itemBuilder: (ctx, index) {
                return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(order[index]['test']),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              'Quantita: ${order[index]['quantity'].toString()}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              'Prezzo per unita: ${order[index]['price'].toString()}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Fornitore: ${order[index]['vendor']}'),
                        ),
                      ],
                    ));
              }),
        ),
      ),
    );
  }
}
