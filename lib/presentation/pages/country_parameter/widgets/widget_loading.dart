import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JumpingText(
            'Carregando dados...',
            style: GoogleFonts.raleway(
              fontSize: 25.0,
              color: Colors.redAccent[100],
            ),
          ),
          SizedBox(height: 50),
          HeartbeatProgressIndicator(
            child: Icon(Icons.search, size: 50, color: Colors.redAccent[100]),
          ),
        ],
      ),
    );
  }
}
