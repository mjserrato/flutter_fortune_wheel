import 'package:flutter/material.dart';

import 'bar_demo.dart';
import 'wheel_demo.dart';

void main() {
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fortune Wheel Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.comfortable,
      ),
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Grogu',
      'Mace Windu',
      'Obi-Wan Kenobi',
      'Han Solo',
      'Luke Skywalker',
      'Darth Vader',
      'Yoda',
      'Ahsoka Tano',
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Fortune Wheel'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Wheel'),
              Tab(text: 'Bar'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WheelDemo(items: items),
            BarDemo(items: items),
          ],
        ),
      ),
    );
  }
}
