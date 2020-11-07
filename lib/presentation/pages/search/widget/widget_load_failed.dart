import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadFailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Card(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Icon(Icons.wifi_off, color: Colors.grey[50]),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'Não foi possível conectar-se à rede...',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
