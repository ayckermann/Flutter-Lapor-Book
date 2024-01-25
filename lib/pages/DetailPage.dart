import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/komen_dialog.dart';
import 'package:flutter_lapor_book/components/status_dialog.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/components/vars.dart';
import 'package:flutter_lapor_book/models/akun.dart';
import 'package:flutter_lapor_book/models/laporan.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});
  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  String? status;

  Future launch(String uri) async {
    if (uri == '') return;
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }

  int totalLike(Laporan laporan) {
    return laporan.like?.length ?? 0;
  }

  bool isLike(Laporan laporan, Akun akun) {
    if (laporan.like == null) return false;
    if (laporan.like!.contains(akun.uid)) {
      return true;
    } else {
      return false;
    }
  }

  void like(Laporan laporan, Akun akun) async {
    CollectionReference laporanCollection = _firestore.collection('laporan');
    try {
      if (!isLike(laporan, akun)) {
        await laporanCollection.doc(laporan.docId).update({
          'like': FieldValue.arrayUnion([akun.uid]),
        });
      } else {
        List<String> listLike = laporan.like ?? [];

        listLike.remove(akun.uid);

        await laporanCollection.doc(laporan.docId).update({
          'like': listLike,
        });
      }

      Navigator.popAndPushNamed(context, '/dashboard');
    } catch (e) {
      print(e);
    }
  }

  void statusDialog(Laporan laporan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatusDialog(
          laporan: laporan,
        );
      },
    );
  }

  void komentarDialog(Akun akun, Laporan laporan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return KomenDialog(
          laporan: laporan,
          akun: akun,
        );
      },
    );
  }

  void deleteKomentar(Akun akun, Laporan laporan, Komentar komentar) async {
    CollectionReference laporanCollection = _firestore.collection('laporan');

    try {
      List<Komentar> listKomentar = laporan.komentar ?? [];

      listKomentar.remove(komentar);

      await laporanCollection.doc(laporan.docId).update({
        'komentar': listKomentar,
      });

      Navigator.popAndPushNamed(context, '/dashboard');
    } catch (e) {
      print(e);
    }
  }

  void dialogDeleteKomentar(Akun akun, Laporan laporan, Komentar komentar) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete ?"),
          actions: [
            IconButton(
                onPressed: () {
                  deleteKomentar(akun, laporan, komentar);
                },
                icon: Icon(Icons.delete)),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    Laporan laporan = arguments['laporan'];
    Akun akun = arguments['akun'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title:
            Text('Detail Laporan', style: headerStyle(level: 3, dark: false)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        laporan.judul,
                        style: headerStyle(level: 3),
                      ),
                      SizedBox(height: 15),
                      imageAndLike(laporan, akun),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textStatus(
                              laporan.status,
                              laporan.status == dataStatus[0]
                                  ? warnaStatus[0]
                                  : laporan.status == dataStatus[1]
                                      ? warnaStatus[1]
                                      : warnaStatus[2],
                              Colors.white),
                          textStatus(
                              laporan.instansi, Colors.white, Colors.black),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: const Center(child: Text('Nama Pelapor')),
                        subtitle: Center(
                          child: Text(laporan.nama),
                        ),
                        trailing: SizedBox(width: 45),
                      ),
                      ListTile(
                        leading: Icon(Icons.date_range),
                        title: Center(child: Text('Tanggal Laporan')),
                        subtitle: Center(
                            child: Text(DateFormat('dd MMMM yyyy')
                                .format(laporan.tanggal))),
                        trailing: IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            launch(laporan.maps);
                          },
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Deskripsi Laporan',
                        style: headerStyle(level: 3),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(laporan.deskripsi ?? ''),
                      ),
                      SizedBox(height: 50),
                      if (akun.role == 'admin')
                        Container(
                          width: 250,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                status = laporan.status;
                              });
                              statusDialog(laporan);
                            },
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
                          onPressed: () {
                            komentarDialog(akun, laporan);
                          },
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
                        style: headerStyle(level: 3),
                      ),
                      SizedBox(height: 20),
                      Container(
                        constraints: const BoxConstraints(maxHeight: 400),
                        child: ListView.builder(
                            itemCount: laporan.komentar?.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onLongPress: () {
                                  if (laporan.komentar![index].uid ==
                                      akun.uid) {
                                    dialogDeleteKomentar(akun, laporan,
                                        laporan.komentar![index]);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        laporan.komentar![index].nama,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        laporan.komentar![index].isi,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
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

  Stack imageAndLike(Laporan laporan, Akun akun) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(5),
          child: laporan.gambar != ''
              ? Image.network(laporan.gambar!)
              : Image.asset('assets/istock-default.jpg'),
        ),
        Container(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 20,
                        color: Colors.black,
                        isSelected: isLike(laporan, akun),
                        onPressed: () {
                          like(laporan, akun);
                        },
                        selectedIcon: const Icon(
                          Icons.favorite,
                        ),
                        icon: const Icon(
                          Icons.favorite_outline,
                        )),
                    Text(
                      totalLike(laporan).toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
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
