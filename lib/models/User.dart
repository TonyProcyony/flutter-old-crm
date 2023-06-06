import 'package:google_sign_in/google_sign_in.dart';

class User {
  final GoogleSignInAccount? user;
  final String? userName;
  final String? userEmail;

  User({this.user, this.userEmail, this.userName});
}
