import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

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
      body:ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];

                  return Dismissible(
                    key: Key(item),
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text("$item dismissed")));
                    },
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment(-0.9, 0),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    child: ListTile(title: Text('$item')),
                  );
                },
              ),
    );
  }
}