import 'package:covid19_tracker_in_flutter/presentation/controllers/historic_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/countries_list/widget/widget_empty_countries.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/countries_list/widget/widget_list_item.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/countries_list/widget/widget_my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountriesList extends StatefulWidget {
  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final _controller = HistoricController(Get.find());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: MyTextField(_controller),
      ),
      body: Obx(() {
        final items = _controller.countriesNames;
        if (items.length == 0) return EmptyCountries();
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
