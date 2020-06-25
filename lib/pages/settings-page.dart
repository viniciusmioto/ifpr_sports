import 'package:flutter/material.dart';
import 'package:ifsports/provider/settings-provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeChanger themeChanger;
  bool systemIsDark;

  @override
  Widget build(BuildContext context) {
    themeChanger = Provider.of(context, listen: false);
    systemIsDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text('CONFIGURAÇÕES'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Dark Theme'),
            trailing: Switch(
              value: themeChanger.isDark(),
              onChanged: (status) {
                themeChanger.setDarkStatus(status);
              },
            ),
          ),
        ],
      ),
    );
  }
}
