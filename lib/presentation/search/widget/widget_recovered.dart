import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recovered extends StatelessWidget {
  final String cardTitle;
  final String caseTitle;
  final int currentData;

  const Recovered({Key key, this.cardTitle, this.currentData, this.caseTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final formatter = new NumberFormat("#,###");

    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 500,
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 20,
                          spreadRadius: 3.5,
                          offset: Offset(0, 13)),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 40,
                            margin: EdgeInsets.all(15),
                            padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 17),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.redAccent.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: RichText(
                                text: TextSpan(
                                  text: "$cardTitle".toUpperCase(),
                                  style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  //currentData != null
                                  //? formatter.format(currentData)
                                  //:
                                  '-',
                                  style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 29),
                                  ),
                                ),
                                Text(
                                  caseTitle ?? "",
                                  style: GoogleFonts.cabin(
                                    textStyle: TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
