import 'package:api/statemanagement/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<HomeScreenProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.eligibilityMessage.toString(),
                    style: TextStyle(
                      color: provider.isEligible == true
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Enter You age",
                    ),
                    onChanged: (value) {
                      provider.checkEligibility(int.parse(value));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
