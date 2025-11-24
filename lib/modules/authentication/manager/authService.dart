import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class authService {
  static Future<UserCredential?> createAccount({
    required String Name,
    required String Email,
    required String Password,
    required String Phone,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
      await credential.user?.updateDisplayName(Name);
      await credential.user?.sendEmailVerification();
      await credential.user?.reload();

      return credential;

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw 'Something went wrong. Try again.';
      }
    } catch (e) {
      print(e);
      throw 'Unexpected error occurred.';
    }
  }

  static Future<UserCredential?> Login({
    required String Email,
    required String Password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email,
        password: Password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Invalid Email or Password.';
      } else if (e.code == 'wrong-password') {
        throw 'Incorrect password';
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> ForgetPassword({required String Email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: Email);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw 'Invalid Email or Password.';
      } else {
        throw 'Something went wrong. Try again.';
      }
    }catch(e){
      print (e);
    }
  }
  static Future<void> saveUserData({
    required String uid,
    required String Name,
    required String Email,
    required String Phone,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': Name,
        'email': Email,
        'phone': Phone,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error saving user data: $e');
      throw 'Failed to save user data';
    }
  }
}
