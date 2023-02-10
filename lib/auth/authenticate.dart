import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:furniture/screens/homescreen.dart';
import 'package:furniture/screens/login/login_screen.dart';

class Authenticate {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbref = FirebaseDatabase.instance.ref().child("Users");

  void registerUser(email, password, ctx) {
    firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (context) => const LoginScreen()));
    }).catchError((err) {
      errorMessage(err, ctx);
    });
  }

  void loginUser(email, password, ctx) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacement(
          ctx, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }).catchError((err) {
      errorMessage(err, ctx);
    });
  }

  void errorMessage(err, ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(err.message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }
}
