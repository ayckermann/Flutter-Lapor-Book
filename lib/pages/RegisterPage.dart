import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/components/validators.dart';
import 'package:flutter_lapor_book/components/input_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => Register();
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _password = TextEditingController();

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
                              'Nama',
                              TextFormField(
                                  validator: notEmptyValidator,
                                  decoration:
                                      customInputDecoration("Nama Lengkap"))),
                          InputLayout(
                              'Email',
                              TextFormField(
                                  validator: notEmptyValidator,
                                  decoration: customInputDecoration(
                                      "email@email.com"))),
                          InputLayout(
                              'No. Handphone',
                              TextFormField(
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
                                      passConfirmationValidator(
                                          value, _password),
                                  obscureText: true,
                                  decoration: customInputDecoration(""))),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            child: FilledButton(
                                style: buttonStyle,
                                child: Text('Register', style: header2),
                                onPressed: () {}),
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
      ),
    );
  }
}
