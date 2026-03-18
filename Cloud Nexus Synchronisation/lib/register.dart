import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lahmerproject/AlertdialogCustom.dart';
import 'package:lahmerproject/login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Créer un compte")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text("Inscription", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text("Créez votre compte pour commencer.", style: TextStyle(color: Colors.grey)),

            const SizedBox(height: 30),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nom complet',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async{
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailCtrl.text,
                    password: passwordCtrl.text,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                    AlertdialogCustom.showErrorDialog(
                    context,
                    AlertType.warning,
                    "Mot de passe faible",
                    "Veuillez choisir un mot de passe plus sécurisé.",
                    Colors.orange,
                    "OK",
                    () => Navigator.of(context).pop(),
                    );
                    } else if (e.code == 'email-already-in-use') {
                    AlertdialogCustom.showErrorDialog(
                    context,
                    AlertType.warning,
                    "Email déjà utilisé",
                    "Un compte existe déjà avec cet email.",
                    Colors.orange,
                    "OK",
                    () => Navigator.of(context).pop(),
                    );
                    } else if (e.code == 'invalid-email') {
                    AlertdialogCustom.showErrorDialog(
                    context,
                    AlertType.error,
                    "Email invalide",
                    "Le format de l'adresse email est incorrect.",
                    Colors.red,
                    "OK",
                    () => Navigator.of(context).pop(),
                    );
                    } else {
                    AlertdialogCustom.showErrorDialog(
                    context,
                    AlertType.error,
                    "Erreur",
                    e.message ?? "Une erreur inconnue est survenue.",
                    Colors.red,
                    "OK",
                    () => Navigator.of(context).pop(),
                    );
                    }
                    }
                    catch (e) {
                    print(e);
                }
              },
              child: const Text("Créer un compte", style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
