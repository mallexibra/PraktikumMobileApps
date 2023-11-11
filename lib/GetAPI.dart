// Import package yang diperlukan
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// URL untuk mengambil data post dari API
String url = "https://jsonplaceholder.typicode.com/posts/1";

// Fungsi untuk mengambil satu post dari API
Future<Post> fetchPost() async {
  // Mengirimkan permintaan GET ke URL yang ditentukan
  final response = await http.get(Uri.parse(url));
  // Memeriksa apakah kode status respons adalah 200 (HTTP OK)
  if (response.statusCode == 200) {
    // Jika respons berhasil, parse JSON dan kembalikan objek Post
    return Post.fromJson(json.decode(response.body));
  } else {
    // Jika respons tidak berhasil, lemparkan pengecualian
    throw Exception('Gagal memuat post');
  }
}

// Kelas Post yang mewakili satu post
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  // Konstruktor untuk membuat objek Post
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  // Metode pabrik untuk mengonversi data JSON menjadi objek Post
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
}

// Kelas GetAPI yang mewakili konten utama dari aplikasi
class GetAPI extends StatefulWidget {
  @override
  _GetAPIState createState() => _GetAPIState();
}

class _GetAPIState extends State<GetAPI> {
  // Mengambil satu post saat widget dibuat
  final Future<Post> post = fetchPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post dari API'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: post,
          builder: (context, snapshot) {
            // Memeriksa status koneksi dari Future
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Menampilkan indikator loading saat menunggu data
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Menampilkan pesan error jika terjadi kesalahan
              return Text('Error: ${snapshot.error}');
            } else {
              // Menampilkan judul dari post yang diambil
              return Text('Judul: ${snapshot.data!.title}');
            }
          },
        ),
      ),
    );
  }
}
