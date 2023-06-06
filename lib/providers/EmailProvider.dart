// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_old_crm/providers/GoogleSignInProvider.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class EmailProvider with ChangeNotifier {
  // String? token;
  // String? email;
  GoogleSignInAccount? user;
  sendEmail(List<Map<String, dynamic>> cart) async {
    final googleSignIn = GoogleSignIn(scopes: ['https://mail.google.com/']);
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    user = googleUser;

    final googleAuth = await googleUser.authentication;

    // print(googleUser);
    // print(googleAuth.accessToken);

    final smtpServer =
        gmailSaslXoauth2(googleUser.email, googleAuth.accessToken!);

    // print('SMTP: $smtpServer');

    // List<String>? order;

    // for (var element in cart) {
    // }

    List productsToSend = [];
    for (var element in cart) {
      // створити новий список в якому будуть всі продукти одного постачальника
      // додати всі продукти з одного списку в інший через join("\n")
      final productsList = element['products'];
      for (var product in productsList) {
        productsToSend
            .add('${product['name']} Quantita: ${product['quantity']}');
      }
      final message = Message()
        ..from = Address(googleUser.email)
        ..recipients = [element['email']]
        ..text = '${element['message']}\n\n${productsToSend.join("\n")}';

      await send(message, smtpServer);
      productsToSend.clear();
    }
    notifyListeners();
  }

  testEmail() async {}
}
