import 'package:flutter/material.dart';
import 'package:leading_page/src/constants/constants_app.dart';
import 'package:leading_page/src/page/leading_page.dart';

class LeadingPageApp extends StatelessWidget {
  const LeadingPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LeadingPageTheme.themeData,
      title: "Xtreme Fetiches",
      home: const LeadingPage(),
    );
  }
}
