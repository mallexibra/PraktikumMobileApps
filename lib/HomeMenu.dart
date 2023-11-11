import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Flutter pertama hehe"),
      ),
      body: const Center(
        child: Text("Selamat datang bos!"),
      ),
    );
  }
}
