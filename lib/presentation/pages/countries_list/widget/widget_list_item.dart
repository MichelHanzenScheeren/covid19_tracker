import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/presentatios_country_parameter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final String item;
  final bool favorite;
  final Function(String) addOrRemoveFavorite;

  ListItem({this.item: '', this.favorite: false, this.addOrRemoveFavorite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text('$item', style: TextStyle(fontSize: 18)),
          ),
          trailing: IconButton(
            icon: Icon(
              favorite ? Icons.star : Icons.star_border,
              color: Colors.redAccent[100],
            ),
            onPressed: () async => await addOrRemoveFavorite(item),
          ),
          onTap: () => Get.to(CountryParameter(country: item)),
        ),
        Divider(height: 8),
      ],
    );
  }
}
