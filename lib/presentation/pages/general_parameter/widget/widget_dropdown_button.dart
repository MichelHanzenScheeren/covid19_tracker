import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownButon extends StatelessWidget {
  final String currentValue;
  final List<String> summarys;
  final Function(String) onChange;

  DropdownButon({
    @required this.currentValue,
    @required this.summarys,
    this.onChange,
  }) : assert(summarys != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              value: currentValue,
              iconEnabledColor: Colors.white,
              style: GoogleFonts.raleway(fontSize: 25, color: Colors.grey[700]),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: onChange,
              items: summarys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Text(
                      _getTranslateValue(value),
                      textAlign: TextAlign.center,
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

  String _getTranslateValue(String value) {
    if (value == 'North America') return 'America do Norte';
    if (value == 'South America') return 'America do Sul';
    if (value == 'Europe') return 'Europa';
    return value;
  }
}
