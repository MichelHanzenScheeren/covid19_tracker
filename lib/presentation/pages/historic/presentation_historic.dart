import 'package:covid19_tracker_in_flutter/presentation/controllers/historic_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/historic/widget/widget_list_item.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/historic/widget/widget_my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: MyTextField(onChange: _controller.changeSearchValue),
      ),
      body: Obx(() {
        final items = _controller.countriesNames;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            final bool favorite = _controller.isFavorite(item);
            return ListItem(
              item: item,
              favorite: favorite,
              addOrRemoveFavorite: _controller.addOrRemoveFavorite,
            );
          },
        );
      }),
    );
  }
}
