import 'dart:math';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/screens/home_screen.dart';

import './home_screen.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<User?> login(String email, String password) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    label: Text("Enter your E-mail"),
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    label: Text("Password"), border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    User? user = await login(
                        emailController.text, passwordController.text);
                    if(user != null) {
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }), (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
