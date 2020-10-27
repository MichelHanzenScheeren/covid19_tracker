import 'package:covid19_tracker_in_flutter/presentation/information/presentation_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsHome extends StatelessWidget{
  final String title;
  final double left;
  final double top;
  final double right;
  final double down;
  final Function onClick;

  const OptionsHome({Key key, this.title, this.left, this.top, this.right, this.down, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, down),
          child: ButtonTheme(
            minWidth: 350.0,
            height: 60.0,
            child: RaisedButton(
              child: Text(
                title,
                style: GoogleFonts.raleway(
                    fontSize: 33.0, color: Colors.white70),
              ),
              color: Colors.red[200].withOpacity(0.6),
              elevation: 4.0,
              splashColor: Colors.grey,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
              onPressed: onClick,
            ),
          )
      ),
    );
  }
}