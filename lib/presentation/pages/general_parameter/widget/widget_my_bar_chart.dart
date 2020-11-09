import 'package:covid19_tracker_in_flutter/presentation/controllers/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';

class MyBarChart extends StatelessWidget {
  final GeneralController controller;

  MyBarChart(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.getCurrentSummary == null) return Container();
      final seriesList = [
        new charts.Series<Map<String, dynamic>, String>(
          id: 'information',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (Map value, _) => value['x'],
          measureFn: (Map value, _) => value['y'],
          fillColorFn: (Map value, _) => charts.ColorUtil.fromDartColor(
            value['color'],
          ),
          data: controller.getChartData(),
        ),
      ];

      return Container(
        margin: const EdgeInsets.fromLTRB(20, 5, 20, 15),
        height: 450,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: charts.BarChart(
              seriesList,
              animate: true,
            ),
          ),
        ),
      );
    });
  }
}
