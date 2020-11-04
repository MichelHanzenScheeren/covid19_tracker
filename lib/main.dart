import 'package:covid19_tracker_in_flutter/dependencies_injection.dart';
import 'package:covid19_tracker_in_flutter/presentation/home/presentation_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/root_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependenciesInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Covid-19 Tracker in Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
