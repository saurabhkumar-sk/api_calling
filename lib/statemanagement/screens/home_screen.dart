import 'package:api/statemanagement/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
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
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: provider.launchUrls,
                    icon: const Icon(Icons.link),
                    label: const Text("Click Here"),
                  ),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: provider.appWebView,
                    icon: const Icon(Icons.link),
                    label: const Text("Launch app Web View"),
                  ),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: provider.googlelaunchUrl,
                    icon: const Icon(Icons.link),
                    label: const Text("Google"),
                  ),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: provider.webApplaunchUrl,
                    icon: const Icon(Icons.link),
                    label: const Text("Launch Url New version"),
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
