import 'package:flutter/material.dart';
import 'package:flutter_pr_3/views/extensions.dart';

class Favouritepage extends StatefulWidget {
  const Favouritepage({super.key});

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favouritepage",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('Favauritepage');
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 25,
            ),
          ),
          10.toWidth(),
        ],
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
