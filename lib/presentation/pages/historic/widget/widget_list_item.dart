import 'package:flutter/material.dart';

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
        ),
        Divider(height: 8),
      ],
    );
  }
}
