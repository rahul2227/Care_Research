import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth authc = FirebaseAuth.instance;
  Future signOut() async {
    try {
      return await authc.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
