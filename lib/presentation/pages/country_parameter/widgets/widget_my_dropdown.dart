import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDown extends StatelessWidget {
  final String title;
  final String current;
  final List<String> items;
  final Function(String) onChange;

  MyDropDown({
    this.title: '',
    this.current,
    this.items,
    this.onChange,
  }) : assert(items != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.cabin(
              color: Colors.grey[800],
              fontSize: 20,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: DropdownButton<String>(
              value: current,
              iconEnabledColor: Colors.white,
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: onChange,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 2.5, left: 5),
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cabin(
                        color: Colors.grey[800],
                        fontSize: 20,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
