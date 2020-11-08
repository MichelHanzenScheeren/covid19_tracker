import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsHome extends StatelessWidget {
  final String title;
  final double top;
  final double down;
  final Function onClick;

  const OptionsHome({
    this.title,
    this.top,
    this.down,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, top, 10, down),
        child: ButtonTheme(
          minWidth: 350.0,
          height: 60.0,
          child: RaisedButton(
            child: Text(
              title,
              style: GoogleFonts.raleway(fontSize: 33.0, color: Colors.white70),
            ),
            color: Colors.red[200].withOpacity(0.6),
            elevation: 4.0,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            onPressed: onClick,
          ),
        ),
      ),
    );
  }
}
