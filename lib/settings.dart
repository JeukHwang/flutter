import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

// Reference: https://medium.com/nerd-for-tech/settings-ui-with-ease-in-flutter-74c3a425fc99
class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SettingsPage(),
    ));
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CounterApp"),
        ),
        body: SettingsList(sections: [
          SettingsSection(
            margin: const EdgeInsetsDirectional.all(20.0),
            title: const Text('Section 1 title?'),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text("English"),
                leading: const Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                  leading: const Icon(Icons.phone_android),
                  initialValue: isSwitched,
                  onToggle: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                  title: const Text("Use System Theme"))
            ],
          ),
          SettingsSection(
              margin: const EdgeInsetsDirectional.all(20.0),
              title: const Text("Section 2"),
              tiles: [
                SettingsTile(
                  title: const Text("Security"),
                  description: const Text("Fingerprint"),
                  leading: const Icon(Icons.lock),
                  onPressed: (BuildContext context) {},
                ),
                SettingsTile.switchTile(
                    initialValue: true,
                    onToggle: (value) {},
                    leading: const Icon(Icons.fingerprint),
                    title: const Text("Use fingerprint"))
              ]),
        ]));
  }
}
