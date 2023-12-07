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
    // TODO: implement dispose
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
        TextField(
          controller: titleController,
          onChanged: (value) {
            userProvider.setTitle = value;
          },
        ),
        TextField(
          controller: bodyController,
        ),
        ElevatedButton(
          onPressed: () {
            userProvider.createPost(
                title: titleController.text, body: bodyController.text);
          },
          child: Text('Click here'),
        ),
      ]),
    );
  }
}
