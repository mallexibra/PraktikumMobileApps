import 'package:flutter/material.dart';

class ColumnMenu extends StatelessWidget {
  const ColumnMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coloumn Pages"),
      ),
      body: Column(
        children: [
          Text("Text 1"),
          Text("Text 2"),
          Text("Text 3"),
        ],
      ),
    );
  }
}
