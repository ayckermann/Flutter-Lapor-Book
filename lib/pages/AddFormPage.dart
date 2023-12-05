import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/components/vars.dart';

import '../components/input_widget.dart';
import '../components/validators.dart';

class AddFormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddFormState();
}

class AddFormState extends State<AddFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:
            Text('Tambah Laporan', style: headerStyle(level: 3, dark: false)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Container(
              margin: EdgeInsets.only(top: 70, left: 40, right: 40),
              child: Column(
                children: [
                  InputLayout(
                      'Judul Laporan',
                      TextFormField(
                          validator: notEmptyValidator,
                          decoration: customInputDecoration("Judul laporan"))),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_camera),
                            Text(' Foto Pendukung',
                                style: headerStyle(level: 3)),
                          ],
                        )),
                  ),
                  InputLayout(
                      'Instansi',
                      DropdownButtonFormField<String>(
                          decoration: customInputDecoration('Instansi'),
                          items: dataInstansi.map((e) {
                            return DropdownMenuItem<String>(
                                child: Text(e), value: e);
                          }).toList(),
                          onChanged: (selected) {})),
                  InputLayout(
                      "Deskripsi laporan",
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        minLines: 3,
                        maxLines: 5,
                        decoration:
                            customInputDecoration('Deskripsikan semua di sini'),
                      )),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    child: FilledButton(
                        style: buttonStyle,
                        onPressed: () {},
                        child: Text(
                          'Kirim Laporan',
                          style: headerStyle(level: 3, dark: false),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
