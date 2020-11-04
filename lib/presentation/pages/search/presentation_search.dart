import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/search/widget/widget_graphic.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/search/widget/widget_informations.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/search/widget/widget_search_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CovidDataController _dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        centerTitle: true,
        title: Text(
          'Parâmetro Geral',
          style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Obx(() {
            final worldSummary = _dataController.worldSummary;
            return Column(
              children: <Widget>[
                SearchButton(),
                NewInformations(
                  cardTitle: "Casos Confirmados",
                  caseTitle: "Total",
                  currentData: worldSummary?.cases,
                  newData: worldSummary?.todayCases,
                ),
                NewInformations(
                  cardTitle: "Recuperados",
                  caseTitle: "Total",
                  currentData: worldSummary?.recovered,
                  newData: worldSummary?.todayRecovered,
                ),
                NewInformations(
                  cardTitle: "Óbitos",
                  caseTitle: "Total",
                  currentData: worldSummary?.deaths,
                  newData: worldSummary?.todayDeaths,
                ),
                Container(
                  height: 300,
                  width: 350,
                  child: Graphic.withSampleData(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
