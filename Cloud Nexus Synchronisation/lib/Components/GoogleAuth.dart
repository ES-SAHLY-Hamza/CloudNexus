import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storage = FlutterSecureStorage();

  Future<void> signInWithGoogle(BuildContext context) async {
    String? email; // Pour stocker l'email
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      email = googleUser.email; // Stocke l'email
      //profileImageUrl = googleUser.photoUrl; // Récupère et stocke l'URL de l'image de profil

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      //await registerUserInDatabase(context, googleUser.email);
    } on UserAlreadyExistsException catch (_) {
      print("User already exists, continuing...");
    } catch (e) {
      print("Error during Google sign-in: $e");
      rethrow;
    } finally {
      if (email != null) {
        await storeEmail(context, email); // Stocke l'email
        Navigator.of(context).pushNamedAndRemoveUntil("/homepage", (route) => false);
      }
      else{
        Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
      }

    }
  }

  Future<void> storeEmail(BuildContext context, String email) async {
    await storage.write(key: 'googleEmail', value: email);
    print("Email stored: $email");
  }

}

class UserAlreadyExistsException implements Exception {}
