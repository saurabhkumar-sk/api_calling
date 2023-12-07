import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final url = "jsonplaceholder.typicode.com/comments";
  var data;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var response =
          await http.get(Uri.http("jsonplaceholder.typicode.com", "comments"));
      print(response.body);
      data = jsonDecode(response.body);
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Api Call',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ListTile(
          title: Text(
            data[1].toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ));
  }
}
