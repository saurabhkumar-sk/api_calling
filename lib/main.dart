import 'dart:convert';

import 'package:api/provider/user_post_provider.dart';
import 'package:api/screen/post_api_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PostApiScreen(),
      ),
    );
  }
}

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
