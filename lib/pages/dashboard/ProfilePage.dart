import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';
import 'package:flutter_lapor_book/models/akun.dart';

class Profile extends StatefulWidget {
  Akun akun;
  Profile({super.key, required this.akun});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  void keluar(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  void gantiPassword() {
    print('GANTI PASSWORD');
  }

  void editProfile() {
    print('Profile Teredit');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    widget.akun.nama,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    widget.akun.noHP,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Text(
                    widget.akun.email,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  Text(
                    widget.akun.role,
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  listContainer(
                    icon: Icons.person_outline,
                    kategori: 'Edit Profile',
                    pencet: editProfile,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  listContainer(
                      icon: Icons.lock_outline,
                      kategori: 'Ubah Password',
                      pencet: gantiPassword),
                  SizedBox(
                    height: 35,
                  ),
                  listContainer(
                    icon: Icons.logout,
                    kategori: 'Logout',
                    pencet: (() => keluar(context)),
                  ),
                ],
              ),
            ),
    );
  }

  Container listContainer({var icon, var kategori, required Function pencet}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: primaryColor, // Warna border
          width: 2.0, // Lebar border
        ),
        borderRadius: BorderRadius.circular(15), // Sudut border
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: primaryColor,
          size: 30,
        ),
        title: Text(
          kategori,
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        onTap: () {
          pencet();
        },
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
        ),
      ),
    );
  }
}
