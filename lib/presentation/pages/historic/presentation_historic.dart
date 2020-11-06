import 'package:covid19_tracker_in_flutter/presentation/controllers/historic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _controller = HistoricController(Get.find());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        centerTitle: true,
        title: Text(
          'Pesquisas Favoritas',
          style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: Obx(() {
        final items = _controller.countriesNames;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final bool favotite = _controller.isFavorite(item);
            return Dismissible(
              key: Key(item),
              onDismissed: (_) async {
                await _controller.addOrRemoveFavorite(item);
              },
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment(-0.9, 0),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => print("OI"),
                    child: ListTile(
                      title: Text('$item', style: TextStyle(fontSize: 18)),
                      trailing: IconButton(
                        icon: Icon(
                          favotite ? Icons.star : Icons.star_border,
                          color: Colors.redAccent[100],
                        ),
                        onPressed: () async {
                          await _controller.addOrRemoveFavorite(item);
                        },
                      ),
                    ),
                  ),
                  Divider(height: 8),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
