import 'package:flutter/material.dart';
import 'package:flutter_old_crm/providers/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: const Text(
            'Accedi',
          ),
        ),
      ),
    );
  }
}
