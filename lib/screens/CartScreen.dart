import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: size.height,
            child: ListView.builder(
                itemCount: cartProvider.cart.length,
                itemBuilder: (context, index) {
                  if (cartProvider.cart.isEmpty) {
                    return const Center(
                      child: Text(
                        'Non ci sono prodotti',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return Dismissible(
                    key: ObjectKey(cartProvider.cart[index]),
                    onDismissed: (direction) {
                      setState(() {
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
                      title: Text(cartProvider.cart[index]['test']),
                      subtitle: Text(cartProvider.cart[index]['vendor']),
                      trailing:
                          Text(cartProvider.cart[index]['quantity'].toString()),
                    ),
                  );
                }),
          ),
          Positioned(
              bottom: 15,
              width: size.width,
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await cartProvider.placeOrder();
                    cartProvider.clearCart();
                    setState(() {});
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
              )),
        ],
      ),
    );
  }
}
