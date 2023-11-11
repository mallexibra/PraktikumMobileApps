import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Todo>> fetchTodos() async {
  final response = await http
      .get(Uri.parse('https://calm-plum-jaguar-tutu.cyclic.app/todos'));
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body)['data'];
    List<Todo> todos = body.map((item) => Todo.fromJson(item)).toList();
    return todos;
  } else {
    throw Exception('Failed to load Todos');
  }
}

class Todo {
  final String todoName;
  final bool isComplete;

  Todo({required this.todoName, required this.isComplete});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      todoName: json['todoName'] ?? '',
      isComplete: json['isComplete'] ?? false,
    );
  }
}

class GetDataTodos extends StatelessWidget {
  final Future<List<Todo>> Todos = fetchTodos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todos from API',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: FutureBuilder<List<Todo>>(
          future: Todos,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
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
                              snapshot.data![index].todoName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 23,
                                  height: 2),
                            ),
                            Text(
                              (snapshot.data![index].isComplete).toString(),
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
