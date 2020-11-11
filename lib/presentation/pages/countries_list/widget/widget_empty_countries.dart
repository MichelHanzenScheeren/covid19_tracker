import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Center(
              child: Text(
                'Nenhum país encontrado...',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Icon(Icons.search_off, size: 100),
      ],
    );
  }
}
