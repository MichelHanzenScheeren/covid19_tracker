import 'package:covid19_tracker_in_flutter/models/summary.dart';
import 'package:covid19_tracker_in_flutter/repositories/covid19_api.dart';
import 'package:flutter/material.dart';

void main() async {
  final api = Covid19Api();
  Map<String, dynamic> response = await api.worldSummary();
  Summary summary = Summary.fromMap(response);
  print(summary.active);
  print(summary.todayCases);
  print(summary.updatedDate);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker in Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(color: Colors.deepPurple),
    );
  }
}
