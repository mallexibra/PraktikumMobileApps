import 'package:flutter/material.dart';
import 'package:praktikum_mobile/ColumnMenu.dart';
import 'package:praktikum_mobile/GetAPI.dart';
import 'package:praktikum_mobile/GetAllDataAPI.dart';
import 'package:praktikum_mobile/GetDataTodos.dart';
import 'package:praktikum_mobile/GetUser.dart';
import 'package:praktikum_mobile/HomeMenu.dart';
import 'package:praktikum_mobile/RowMenu.dart';
import 'package:praktikum_mobile/Tugas1.dart';
import 'package:praktikum_mobile/onBoard/AppScrollbar.dart';

void main() {
  runApp(const MyApp());
}

// Nama: Maulana Malik Ibrahim
// Kelas: 2C TRPL
// NIM: 362258302039

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplikasi flutter",
      // home: HomeMenu(),
      // home: ColumnMenu(),
      // home: RowMenu(),
      // home: Tugas1(),
      // home: GetAPI(),
      // home: GetAllDataAPI(),
      // home: GetUser(),
      // home: GetDataTodos(),
      home: IntroScreen(),
    );
  }
}
