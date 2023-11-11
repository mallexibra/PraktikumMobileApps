import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProdukDetail({Key? key, this.kodeProduk, this.namaProduk, this.harga})
      : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Detail Produk',
            style: TextStyle(
                color: Color(0xff000000), fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xfffdbe11),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to the entire body
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: const Text(
                    "Detail Produk",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  )),
              Text("Kode Produk : " + widget.kodeProduk.toString()),
              Text("Nama Produk : ${widget.namaProduk}"),
              Text("Harga : ${widget.harga}")
            ],
          ),
        ));
  }
}
