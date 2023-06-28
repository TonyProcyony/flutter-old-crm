import 'package:flutter/material.dart';
import 'package:flutter_old_crm/models/Orders.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:flutter_old_crm/providers/EmailProvider.dart';
import 'package:flutter_old_crm/screens/AddMessageScreen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List products = [];

  getProducts(BuildContext context, List<Orders> cart) {
    for (var object in cart) {
      for (var element in object.products!) {
        if (!products.contains(element)) {
          products.add(element);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    getProducts(context, cartProvider.cart);
    return SafeArea(
      child: Stack(
        children: [
          products.isEmpty
              ? const Center(
                  child: Text(
                    'Non ci sono prodotti',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : SizedBox(
                  height: size.height,
                  child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        if (products.isEmpty) {
                          return const Center(
                            child: Text(
                              'Non ci sono prodotti',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        // return Container();
                        return Dismissible(
                          key: ObjectKey(products[index]),
                          onDismissed: (direction) {
                            setState(() {
                              products.removeAt(index);
                              cartProvider.cart.removeAt(index);
                            });
                          },
                          background: Container(
                            color: const Color.fromRGBO(228, 24, 24, 1),
                            alignment: Alignment.centerRight,
                            child: const Icon(Icons.delete),
                          ),
                          direction: DismissDirection.endToStart,
                          child: ListTile(
                            title: Text(products[index].name),
                            subtitle: Text(products[index].vendor),
                            trailing: Text(
                                '${products[index].quantity.toString()} ${products[index].type}'),
                          ),
                        );
                      }),
                ),
          Positioned(
            bottom: 15,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(AddMessageScreen.routeName),
                  style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.blue),
                      ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Aggiugni messaggio',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await cartProvider.placeOrder();
                    final emailProvider =
                        Provider.of<EmailProvider>(context, listen: false);
                    await emailProvider.sendEmail(cartProvider.cart);
                    setState(() {
                      cartProvider.clearCart();
                      products.clear();
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 20,
                    ),
                    child: Text(
                      'Ordina',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
