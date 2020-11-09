import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryInformation extends StatelessWidget {
  final CountrySummary summary;
  CountryInformation(this.summary);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Card(
        color: Colors.grey[400],
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                summary.imageUrl,
                fit: BoxFit.cover,
                width: 80,
                height: 60,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.error_outline,
                  size: 60,
                  color: Colors.grey[50],
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            title: Text(
              'País: ${summary.country} (${summary.countryAbbreviation1})',
              style: GoogleFonts.cabin(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'Continente: ${summary.continent}',
                style: GoogleFonts.cabin(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
