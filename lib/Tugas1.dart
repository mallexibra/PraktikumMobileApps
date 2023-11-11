import 'package:flutter/material.dart';

// Nama: Maulana Malik Ibrahim
// Kelas: 2CTRPL
// NIM: 362258302039

class Tugas1 extends StatelessWidget {
  const Tugas1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          tooltip: 'Icons Home',
          onPressed: () {},
        ),
        title: Center(
          child: Text("Home"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Icons Menu',
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
            child: Text(
              "List Makanan",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1. Bakso"),
              Text("2. Soto Ayam"),
              Text("3. Ayam Geprek"),
              Text("4. Bebek Goreng"),
              Text("5. Pecel")
            ],
          )
        ],
      ),
    );
  }
}
