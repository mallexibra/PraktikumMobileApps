import 'package:flutter/material.dart';

class RowMenu extends StatelessWidget {
  const RowMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Row Menu Flutter"),
      ),
      body: Row(
        children: [
          Text("Row 1"),
          Text("Row 2"),
          Text("Row 3"),
          Text("Row 4"),
          Text("Row 5"),
        ],
      ),
    );
  }
}
