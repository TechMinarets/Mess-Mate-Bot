import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String res = 'Something Error Occurred';
    try {
      //register user
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        print("SIgn up completed, userId = ${cred.user!.uid}");

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //login

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = 'Please enter all the fields';
      }
    } //can use FirebaseAuth exception to create custom error message
    catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signInWithGoogle() async {
    String res = 'Some error occurred';
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthProvider);
      res = "success";
    } catch (e) {
      res = "error occurred";
      print(e.toString());
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
