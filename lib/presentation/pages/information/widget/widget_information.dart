import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Expansiontile extends StatelessWidget {
  final String title;
  final String text;

  const Expansiontile({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: Colors.transparent,
                ),
                child: ExpansionTile(
                  title: Text(
                    title,
                    style: GoogleFonts.raleway(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent[100],
                    ),
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        text,
                        style: GoogleFonts.raleway(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
