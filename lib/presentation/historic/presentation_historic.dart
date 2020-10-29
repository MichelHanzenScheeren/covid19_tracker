import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent[100],
          centerTitle: true,
          title: Text('Pesquisas Favoritas',
              style:
              GoogleFonts.raleway(fontSize: 25.0, color: Colors.white))
      ),
      body: SingleChildScrollView(),
    );
  }
}
