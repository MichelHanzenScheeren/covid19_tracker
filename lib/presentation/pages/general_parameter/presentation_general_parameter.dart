import 'package:covid19_tracker_in_flutter/presentation/controllers/general_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/general_parameter/widget/widget_dropdown_button.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/general_parameter/widget/widget_graphic.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/general_parameter/widget/widget_informations.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/general_parameter/widget/widget_load_failed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralParameter extends StatelessWidget {
  final GeneralController _controller = GeneralController(Get.find());

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
                summary != null ? Container() : LoadFailed(),
                DropdownButon(
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
                summary == null
                    ? Container()
                    : Container(
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
