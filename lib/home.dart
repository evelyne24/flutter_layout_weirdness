import 'package:flutter/material.dart';
import 'package:layout_weirdness/scrollable_footer_layout.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Center me, please'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScrollableFooterLayout(
          children: <Widget>[
            Text(
              'Center the image below vertically, while the button stays at the bottom.',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 16.0),
            Align(
                alignment: Alignment.center,
                child: Image.network('http://placekitten.com/g/200/300')),
          ],
          footer: RaisedButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Go to settings'),
            onPressed: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
        ),
      ),
    );
  }
}
