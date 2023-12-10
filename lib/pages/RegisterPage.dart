import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/components/validators.dart';
import 'package:flutter_lapor_book/components/input_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _password = TextEditingController();

  String? nama;
  String? email;
  String? noHP;
  String? password;
  String? password2;

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
                              onChanged: (String value) => setState(() {
                                      nama = value;
                                    }),
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("Nama Lengkap"))),
                        InputLayout(
                            'Email',
                            TextFormField(
                                onChanged: (String value) => setState(() {
                                      email = value;
                                    }),
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("email@email.com"))),
                        InputLayout(
                            'No. Handphone',
                            TextFormField(
                              onChanged: (String value) => setState(() {
                                      noHP = value;
                                    }),
                                validator: notEmptyValidator,
                                decoration:
                                    customInputDecoration("+62 80000000"))),
                        InputLayout(
                            'Password',
                            TextFormField(
                                controller: _password,
                                validator: notEmptyValidator,
                                obscureText: true,
                                decoration: customInputDecoration(""))),
                        InputLayout(
                            'Konfirmasi Password',
                            TextFormField(
                                validator: (value) =>
                                    passConfirmationValidator(value, _password),
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
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/login',
                                      ModalRoute.withName('/login'));
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
