import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final Function(String) onChange;

  MyTextField({this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(-10, 0, 0),
      child: TextField(
        onChanged: onChange,
        style: GoogleFonts.raleway(fontSize: 23, color: Colors.grey[50]),
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Pesquisar',
          hintStyle: GoogleFonts.raleway(
            fontSize: 24,
            color: Colors.grey[50],
          ),
          contentPadding: const EdgeInsets.only(bottom: 4),
          enabledBorder: _border(),
          focusedBorder: _border(),
        ),
      ),
    );
  }

  UnderlineInputBorder _border() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[50]),
    );
  }
}
