import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHome extends StatelessWidget{
  final String title;
  final String subtitle;
  const TitleHome({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.raleway(color: Colors.white, fontSize: 60.0),
          ),
          Text(
            subtitle,
            style: GoogleFonts.raleway(color: Colors.white, fontSize: 30.0),
          ),
        ],
      )
    );
  }

}