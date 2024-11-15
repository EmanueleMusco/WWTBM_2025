// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:who_want_to_be_millionaire/auth/desktop_login_page.dart';
import 'package:who_want_to_be_millionaire/auth/mobile_login_page.dart';
import 'package:who_want_to_be_millionaire/pages/Admin/admin_home.dart';
import 'package:who_want_to_be_millionaire/pages/Player/player_home.dart';
import 'package:who_want_to_be_millionaire/responsive/responsive_layout.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveLayout(
        //!cambiare la mobilebody quando si finisce di fare le pagine, aggiungere il routing qui
        mobileBody: MobileLoginPage(),
        desktopBody: DesktopLoginPage(),
      ),
      routes: {
        '/playerhome': (context) => const PlayerHome(),
        '/adminhome': (context) => const AdminHome(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
