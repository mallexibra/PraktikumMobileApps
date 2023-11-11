import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'dart:async';
import 'dart:convert';

Future<List<Post>> fetchPosts() async {
  final response =
      await https.get(Uri.parse('https://kegiatanpendarungan.id/api/v1/users'));

  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body)['data'];
    List<Post> posts = body.map((item) => Post.fromJson(item)).toList();
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}

class Post {
  final String fullname;
  final String email;

  Post({required this.fullname, required this.email});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      fullname: json['fullname'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class GetUser extends StatelessWidget {
  final Future<List<Post>> posts = fetchPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts from API'),
      ),
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: posts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error nih: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 340,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0, // Border width
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              blurRadius: 3.0, // Shadow blur radius
                              offset: Offset(0, 1), // Shadow offset
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data![index].fullname,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23,
                                  height: 2),
                            ),
                            Text(
                              snapshot.data![index].email,
                              style: TextStyle(height: 2),
                            )
                          ],
                        ),
                      ));
                  // return ListTile(
                  //   title: Text(snapshot.data![index].title),
                  //   subtitle: Text(snapshot.data![index].body),
                  // );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
