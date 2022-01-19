import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './login_screen.dart';

class Registar extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<User?> signUp(email, password) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
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
              TextField(
                obscureText: true,
                controller: confirmPasswordController,
                decoration: InputDecoration(
                    label: Text("Confirm Password"),
                    border: OutlineInputBorder()),
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
                    User? user = await signUp(
                        emailController.text, passwordController.text);
                    if (user != null) {
                      print("Succes" + user.email.toString());
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(

                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text("Already have an account? Log In here."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
