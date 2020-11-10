import 'package:covid19_tracker_in_flutter/presentation/controllers/line_chart_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/widgets/widget_my_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyLineChart extends StatelessWidget {
  final LineChartController controller = LineChartController(Get.find());
  final bool showChart;
  final String countryName;

  MyLineChart({
    this.showChart: false,
    this.countryName,
  }) : assert(countryName != null);

  @override
  Widget build(BuildContext context) {
    if (!showChart) return Container();
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Obx(() {
          return Column(
            children: [
              SizedBox(height: 15),
              Text(
                'Histórico do País',
                style: GoogleFonts.cabin(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 5),
              MyDropDown(
                title: 'Métrica:',
                items: LineChartController.metrics,
                current: controller.getCurrentMetric(),
                onChange: controller.setCurrentMetric,
              ),
              MyDropDown(
                title: 'Período:',
                items: LineChartController.periods,
                current: controller.getCurrentPeriod(),
                onChange: controller.setCurrentPeriod,
              ),
              MyDropDown(
                title: 'Intervalo:',
                items: LineChartController.intervals,
                current: controller.getCurrentInterval(),
                onChange: controller.setCurrentInterval,
              ),
              FutureBuilder(
                future: controller.getChartData(countryName),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == false)
                    return _loadingChart(context);
                  return _buildChart();
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _loadingChart(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 70),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          JumpingText(
            'Carregando dados...',
            style: GoogleFonts.cabin(
              fontSize: 22,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          HeartbeatProgressIndicator(
            child: Icon(Icons.query_builder, size: 50, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }

  Widget _buildChart() {
    final seriesList = [
      charts.Series<Map<String, dynamic>, DateTime>(
        id: 'information',
        domainFn: (map, _) => map['x'],
        measureFn: (map, _) => map['y'],
        colorFn: (map, _) => charts.ColorUtil.fromDartColor(map['color']),
        data: controller.seriesData(),
      ),
    ];
    return Container(
      height: 400,
      padding: const EdgeInsets.all(10),
      child: charts.TimeSeriesChart(
        seriesList,
        animate: true,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }
}
