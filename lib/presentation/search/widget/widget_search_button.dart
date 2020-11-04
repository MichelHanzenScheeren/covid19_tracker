import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: DropdownButton<String>(
              value: dropdownValue,
              iconEnabledColor: Colors.white,
              style:
                  GoogleFonts.raleway(fontSize: 25.0, color: Colors.grey[600]),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox.fromSize(
            size: Size(45, 45),
            child: ClipOval(
                child: Material(
              color: Colors.transparent, // button color
              child: InkWell(
                splashColor: Colors.grey, // splash color
                onTap: () {}, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.search),
                  ],
                ),
              ),
            )),
          )
        ]));
  }
}
