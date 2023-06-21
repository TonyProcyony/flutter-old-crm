import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/CartProvider.dart';
import 'package:provider/provider.dart';

class AddMessageScreen extends StatelessWidget {
  static const routeName = 'add-message-screen';
  AddMessageScreen({super.key});

  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView.builder(
        itemCount: cartProvider.cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cartProvider.cart[index]['vendor']),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 10,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              controller: _subjectController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    width: 1,
                                  ),
                                ),
                                hintText: 'Oggetto mail',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                                    width: 1,
                                  ),
                                ),
                                hintText: "Messaggio",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () {
                                cartProvider.cart[index]['message'] =
                                    _messageController.text;
                                cartProvider.cart[index]['emailSubject'] =
                                    _subjectController.text;
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.primary,
                                    duration: const Duration(seconds: 2),
                                    elevation: 3,
                                    behavior: SnackBarBehavior.floating,
                                    margin: const EdgeInsets.all(20),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    content: const Text('Messaggio aggiunto'),
                                  ),
                                );
                                _messageController.clear();
                                _subjectController.clear();
                              },
                              child: const Text(
                                'Aggiugni messaggio',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
