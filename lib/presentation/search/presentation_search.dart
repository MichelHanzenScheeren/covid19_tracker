import 'package:covid19_tracker_in_flutter/presentation/search/widget/widget_informations.dart';
import 'package:covid19_tracker_in_flutter/presentation/search/widget/widget_recovered.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent[100],
          centerTitle: true,
          title: Text('Parâmetro Geral',
              style:
              GoogleFonts.raleway(fontSize: 25.0, color: Colors.white))
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewInformations(
              cardTitle: "Casos Confirmados",
              caseTitle: "Total",
            ),
            Recovered(
              cardTitle: "Recuperados",
              caseTitle: "Total",
            ),
            NewInformations(
              cardTitle: "Óbitos",
              caseTitle: "Total",
            ),
          ],
        ),
    ));
    }
}
