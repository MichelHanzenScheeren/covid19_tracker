import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/bar_chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBarChart extends StatelessWidget {
  final Summary summary;
  final BarChartController controller;

  MyBarChart(this.summary) : controller = BarChartController(summary);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (summary == null) return Container();
      final seriesList = [
        charts.Series<Map<String, dynamic>, String>(
          id: 'information',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (Map value, _) => value['x'],
          measureFn: (Map value, _) => value['y'],
          fillColorFn: (map, _) => charts.ColorUtil.fromDartColor(map['color']),
          data: controller.getChartData(),
        ),
      ];

      return Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 15),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _selectionText(
                    text: 'TOTAL',
                    type: CurrentChart.total,
                  ),
                  _selectionText(
                    text: 'HOJE',
                    type: CurrentChart.today,
                  ),
                ],
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.all(10),
                child: charts.BarChart(
                  seriesList,
                  animate: false,
                  animationDuration: Duration(milliseconds: 300),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _selectionText({String text: '', CurrentChart type}) {
    final enabled = type == controller.getCurrentChart();
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => controller.setCurrentChart(type),
      child: Container(
        alignment: Alignment.center,
        width: 120,
        padding: const EdgeInsets.only(bottom: 2.5),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: enabled ? Colors.redAccent[100] : Colors.grey[300],
              width: 3,
            ),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.cabin(
            textStyle: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
