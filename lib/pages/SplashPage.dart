import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // harusnya ini nanti diganti cek koneksi ke firebase dan cek login

    User? user = _auth.currentUser;

    if (user != null) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/dashboard');
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }

    // Future.delayed(Duration.zero, () {
    //   Navigator.pushReplacementNamed(context, '/login');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Selamat datang di Aplikasi Laporan'),
      ),
    );
  }
}
