import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchButon extends StatelessWidget {
  final String currentValue;
  final List<String> summarys;
  final Function(String) onChange;

  SearchButon({
    @required this.currentValue,
    @required this.summarys,
    this.onChange,
  }) : assert(summarys != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: currentValue,
              iconEnabledColor: Colors.white,
              style: GoogleFonts.raleway(fontSize: 25, color: Colors.grey[600]),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: onChange,
              items: summarys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(_getTranslateValue(value)),
                  ),
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
              ),
            ),
          )
        ],
      ),
    );
  }

  String _getTranslateValue(String value) {
    if (value == 'North America') return 'America do Norte';
    if (value == 'South America') return 'America do Sul';
    if (value == 'Europe') return 'Europa';
    return value;
  }
}
