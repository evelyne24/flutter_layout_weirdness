import 'package:flutter/material.dart';
import 'package:layout_weirdness/scrollable_footer_layout.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = {
      'alarm': Icons.alarm,
      'calendar': Icons.calendar_today,
      'backup': Icons.backup,
      'calls': Icons.call,
      'message': Icons.message,
    };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Settings'),
        leading: BackButton(),
      ),
      body: ScrollableFooterLayout(
        children: <Widget>[
          for (var setting in settings.keys)
            ListTile(
              title: Text(
                  '${setting[0].toUpperCase()}${setting.substring(1)} settings'),
              subtitle: Text('Set your $setting preferences'),
              trailing: Icon(settings[setting]),
              onTap: () {},
            )
        ],
        footer: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            color: Colors.purple,
            textColor: Colors.white,
            child: Text('More settings'),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings2');
            },
          ),
        ),
      ),
    );
  }
}
