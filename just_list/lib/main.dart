import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_list/screens/home_screen.dart';
import 'package:intl/intl.dart';

void main() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just List',
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: HomeScreen(),
    );
  }
}
