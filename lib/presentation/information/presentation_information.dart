import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent[100],
          centerTitle: true,
          title: Text('Informações',
              style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.white))),
      //body: ,
    );
  }
}
