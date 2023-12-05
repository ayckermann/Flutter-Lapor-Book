import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Judul Laporan',
                  style: header3,
                ),
                SizedBox(height: 15),
                Image.asset('assets/istock-default.jpg'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textStatus('Process', Colors.green, Colors.white),
                    textStatus('Instansi  ', Colors.white, Colors.black),
                  ],
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Center(child: Text('Nama Pelapor')),
                  subtitle: Center(
                    child: Text('Ayatullah Beckham'),
                  ),
                  trailing: SizedBox(width: 45),
                ),
                ListTile(
                  leading: Icon(Icons.date_range),
                  title: Center(child: Text('Tanggal Laporan')),
                  subtitle: Center(child: Text('18/12/2022')),
                  trailing: IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Deskripsi Laporan',
                  style: header3,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text('Deskripsi Laporan'),
                ),
                SizedBox(height: 30),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Ubah Status'),
                  ),
                ),
                Container(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Tambah Komentar'),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'List Komentar',
                  style: header3,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 800,
                  child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama Komentar',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Komentar',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container textStatus(String text, var bgcolor, var textcolor) {
    return Container(
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bgcolor,
          border: Border.all(width: 1, color: primaryColor),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        text,
        style: TextStyle(color: textcolor),
      ),
    );
  }
}
