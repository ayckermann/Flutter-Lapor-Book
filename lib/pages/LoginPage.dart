import 'package:flutter/material.dart';

import '../components/input_widget.dart';
import '../components/styles.dart';
import '../components/validators.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => LoginFull();
}

class LoginFull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginFull> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                Text('Register', style: header1),
                Container(
                  child: const Text(
                    'Create your profile to start your journey',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputLayout(
                              'Email',
                              TextFormField(
                                  validator: notEmptyValidator,
                                  decoration: customInputDecoration(
                                      "email@email.com"))),
                          InputLayout(
                              'Password',
                              TextFormField(
                                  validator: notEmptyValidator,
                                  obscureText: true,
                                  decoration: customInputDecoration(""))),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            child: FilledButton(
                                style: buttonStyle,
                                child: Text('Login',
                                    style: headerStyle(level: 3, dark: false)),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/dashboard',
                                      ModalRoute.withName('/dashboard'));
                                }),
                          )
                        ],
                      )),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum punya akun? '),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: Text('Daftar di sini',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
