import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/components/styles.dart';

class Profile extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Text(
              'Ini FAZA',
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 100,
            ),
            listContainer(Icons.person_outline, 'Edit Profile', editProfile()),
            SizedBox(
              height: 35,
            ),
            listContainer(Icons.lock_outline, 'Ubah Password', gantiPassword()),
            SizedBox(
              height: 35,
            ),
            listContainer(Icons.logout, 'Logout', keluar(context)),
            // ElevatedButton(
            //     onPressed: () async {
            //       await _auth.signOut();
            //       Navigator.pushNamedAndRemoveUntil(
            //           context, '/login', ModalRoute.withName('/login'));
            //     },
            //     child: Text('Logout'))
          ],
        ),
      ),
    );
  }

  Container listContainer(var icon, var kategori, void pencet) {
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
          pencet;
        },
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: primaryColor,
        ),
      ),
    );
  }
}
