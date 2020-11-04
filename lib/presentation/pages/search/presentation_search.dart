import 'package:covid19_tracker_in_flutter/presentation/controllers/search_controller.dart';
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
  final SearchController _controller = SearchController(Get.find());

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
            final summary = _controller.getCurrentSummary;
            return Column(
              children: <Widget>[
                SearchButon(
                  currentValue: _controller.getCurrentSummaryName,
                  summarys: _controller.getListOfSummarys,
                  onChange: _controller.setCurrentSummaryName,
                ),
                NewInformations(
                  cardTitle: "Casos Confirmados",
                  currentData: summary?.cases,
                  newData: summary?.todayCases,
                ),
                NewInformations(
                  cardTitle: "Recuperados",
                  currentData: summary?.recovered,
                  newData: summary?.todayRecovered,
                ),
                NewInformations(
                  cardTitle: "Óbitos",
                  currentData: summary?.deaths,
                  newData: summary?.todayDeaths,
                ),
                SizedBox(height: 10),
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width - 40,
                  child: Graphic.withSampleData(summary),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
