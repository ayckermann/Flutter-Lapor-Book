import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/components/validators.dart';
import 'package:flutter_lapor_book/components/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void initState() {
    super.initState();
  }

  void register() async {
    setState(() {
      _isLoading = true;
    });
    try {
      CollectionReference akunCollection =
          FirebaseFirestore.instance.collection('akun');

      final navigator = Navigator.of(context);

      final nama = namaController.text;
      final email = emailController.text;
      final noHP = noHPController;
      final password = passwordController.text;
      // final confirmPassword = confirmPasswordController.text;

      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await akunCollection.add({
        'uid': _auth.currentUser!.uid,
        'nama': nama,
        'email': email,
        'noHP': noHP,
        'docId': akunCollection.id,
        // ignore: invalid_return_type_for_catch_error
      }).catchError((error) => print("Failed to add user: $error"));

      navigator.pop();
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
                            'Nama',
                            TextFormField(
                                controller: namaController,
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("Nama Lengkap"))),
                        InputLayout(
                            'Email',
                            TextFormField(
                                controller: emailController,
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("email@email.com"))),
                        InputLayout(
                            'No. Handphone',
                            TextFormField(
                                controller: noHPController,
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("+62 80000000"))),
                        InputLayout(
                            'Password',
                            TextFormField(
                                controller: passwordController,
                                validator: notEmptyValidator,
                                obscureText: true,
                                decoration: customInputDecoration(""))),
                        InputLayout(
                            'Konfirmasi Password',
                            TextFormField(
                                validator: (value) => passConfirmationValidator(
                                    value, passwordController),
                                obscureText: true,
                                decoration: customInputDecoration(""))),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          width: double.infinity,
                          child: FilledButton(
                              style: buttonStyle,
                              child: Text('Register', style: header2),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  register();
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      '/login', ModalRoute.withName('/login'));
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
                  Text('Sudah punya akun? '),
                  InkWell(
                    onTap: () {
                      print('ke bagian login');
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login di sini',
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
