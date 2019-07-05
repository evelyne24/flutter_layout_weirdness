import 'package:flutter/material.dart';
import 'package:layout_weirdness/scrollable_footer_layout.dart';

class MoreSettingsScreen extends StatefulWidget {
  @override
  _MoreSettingsScreenState createState() => _MoreSettingsScreenState();
}

class _MoreSettingsScreenState extends State<MoreSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = {
      'alarm': Icons.alarm,
      'calendar': Icons.calendar_today,
      'backup': Icons.backup,
      'calls': Icons.call,
      'message': Icons.message,
      'ac': Icons.ac_unit,
      'balance': Icons.account_balance,
      'airplane mode': Icons.airplanemode_active,
      'beach holiday': Icons.beach_access,
      'artistic skills': Icons.brush,
      'settings': Icons.settings,
      'work': Icons.work,
      'cake glazing': Icons.cake,
      'cloud': Icons.cloud
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.green,
        leading: BackButton(),
      ),
      body: ScrollableFooterLayout(
        children: <Widget>[
          for (var setting in settings.keys)
            ListTile(
              title: Text(
                  '${setting[0].toUpperCase()}${setting.substring(1)} settings'),
              subtitle: Text('Set your ${setting} preferences'),
              trailing: Icon(settings[setting]),
              onTap: () {},
            )
        ],
        footer: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            child: Text('Less settings'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
