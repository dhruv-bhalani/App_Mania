import 'package:flutter_pr_3/utills/routes.dart';
import 'package:flutter_pr_3/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr_3/views/detail_page.dart';

void main() {
  runApp(
    const RecipeApp(),
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
      },
    );
  }
}
