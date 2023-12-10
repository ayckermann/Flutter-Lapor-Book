import 'package:flutter/material.dart';

import '../components/input_widget.dart';
import '../components/styles.dart';
import '../components/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool passwordVisible = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final navigator = Navigator.of(context);
      final email = _emailController.text;
      final password = _passwordController.text;
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      Navigator.pushNamedAndRemoveUntil(
          context, '/dashboard', ModalRoute.withName('/dashboard'));
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                controller: _emailController,
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("email@email.com"))),
                        InputLayout(
                            'Password',
                            TextFormField(
                                controller: _passwordController,
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
                                if (_formKey.currentState!.validate()) {
                                  login();
                                }
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
    );
  }
}
