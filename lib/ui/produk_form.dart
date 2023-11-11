import 'package:flutter/material.dart';
import 'package:praktikum_mobile/ui/produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Produk',
          style:
              TextStyle(color: Color(0xff000000), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xfffdbe11),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _textBoxKodeProduk(),
            _textBoxNamaProduk(),
            _textBoxHargaProduk(),
            _buttonSave()
          ],
        ),
      ),
      backgroundColor: const Color(0xffffffff),
    );
  }

  _textBoxKodeProduk() {
    return TextField(
        decoration: const InputDecoration(labelText: "Kode Produk"),
        controller: _kodeProdukTextboxController);
  }

  _textBoxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
    );
  }

  _textBoxHargaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaProdukTextboxController,
    );
  }

  _buttonSave() {
    return ElevatedButton(
        onPressed: () {
          String kodeProduk = _kodeProdukTextboxController.text;
          String namaProduk = _namaProdukTextboxController.text;
          int harga = int.parse(
              _hargaProdukTextboxController.text); //parsing dari String ke int
          // pindah ke halaman Produk Detail dan mengirim data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProdukDetail(
                kodeProduk: kodeProduk,
                namaProduk: namaProduk,
                harga: harga,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xfffdbe11), // Background color
          onPrimary: const Color(0xff000000), // Text color
          elevation: 5,
          fixedSize: const Size(double.infinity, 30),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding
          textStyle: const TextStyle(
            fontSize: 18, // Text size
            fontWeight: FontWeight.bold, // Text weight
          ),
        ),
        child: const Text('Simpan'));
  }
}
