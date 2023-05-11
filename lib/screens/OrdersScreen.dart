import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_old_crm/screens/OrderDetailScreen.dart';
import 'package:intl/intl.dart';

import '../widgets/SettingWidget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: FirebaseFirestore.instance.collection('orders').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs;
              final timestamp = data[index]['date'];
              DateTime date = timestamp.toDate();
              return ListTile(
                onTap: () => Navigator.of(context)
                    .pushNamed(OrderDetailScreen.routeName, arguments: {
                  'order': data[index],
                }),
                title: Text('${date.day}/${date.month}/${date.year}'),
              );
            },
          );
        },
      ),
    );
  }
}
