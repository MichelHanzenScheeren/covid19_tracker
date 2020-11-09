import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewInformations extends StatelessWidget {
  final String cardTitle;
  final int currentData;
  final int newData;
  final Color color;

  const NewInformations({
    this.cardTitle,
    this.currentData,
    this.newData,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      child: Card(
        color: color,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color.withAlpha(220),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "$cardTitle".toUpperCase(),
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: <Widget>[
                  _dataColumn(currentData, 'Total'),
                  Spacer(),
                  _dataColumn(newData, 'Novos'),
                  Spacer(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataColumn(int data, String legend) {
    final formatter = NumberFormat("#,###");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          data != null ? formatter.format(data) : '-',
          style: GoogleFonts.cabin(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 29,
            ),
          ),
        ),
        Text(
          legend,
          style: GoogleFonts.cabin(
            textStyle: TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.w300,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
