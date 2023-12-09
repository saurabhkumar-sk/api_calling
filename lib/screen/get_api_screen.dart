import 'package:api/models/api_user_model.dart';
import 'package:api/provider/user_post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetAPiScreen extends StatefulWidget {
  const GetAPiScreen({super.key});

  @override
  State<GetAPiScreen> createState() => _GetAPiScreenState();
}

class _GetAPiScreenState extends State<GetAPiScreen> {
  bool loading = true;
  late UserProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of(context, listen: false);
    provider.getApiUser().then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    provider.apiUSerList.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api Screen'),
      ),
      body: Selector<UserProvider, List<ApiUserModel>>(
        selector: (p0, p1) => p1.apiUSerList,
        builder: (context, users, child) => loading
            ? const CircularProgressIndicator()
            : !loading & users.isEmpty
                ? const Text('Something went wrong')
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(users[index].name),
                        subtitle: Text(users[index].email),
                        trailing: Text(
                          users[index].username,
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
