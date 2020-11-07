import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
            child: Center(
              child: Text(
                'Nenhum país encontrado...',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Icon(Icons.search_off, size: 80),
      ],
    );
  }
}
