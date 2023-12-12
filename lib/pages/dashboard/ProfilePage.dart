import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text('ini profil'),
            ElevatedButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', ModalRoute.withName('/login'));
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
