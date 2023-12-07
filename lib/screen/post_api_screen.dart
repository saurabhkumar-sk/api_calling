import 'package:api/provider/user_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostApiScreen extends StatefulWidget {
  const PostApiScreen({super.key});

  @override
  State<PostApiScreen> createState() => _PostApiScreenState();
}

class _PostApiScreenState extends State<PostApiScreen> {
  late UserProvider userProvider;
  final bodyController = TextEditingController();

  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    bodyController.dispose;
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Api Screen'),
        backgroundColor: Colors.red,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: titleController,
            onChanged: (value) {
              userProvider.setTitle = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: bodyController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              userProvider.createPost(
                  title: titleController.text, body: bodyController.text);
            },
            child: Text('Click here'),
          ),
        ),
      ]),
    );
  }
}
