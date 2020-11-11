import 'package:covid19_tracker_in_flutter/presentation/controllers/line_chart_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/pages/country_parameter/widgets/widget_my_dropdown.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
                  if (!snapshot.hasData) return _loadingChart(context);
                  if (snapshot.data == false) return _noData(context);
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

  Widget _noData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50, bottom: 70),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Text(
            'Histórico indisponível...',
            style: GoogleFonts.cabin(
              fontSize: 20,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Icon(Icons.error_outline, size: 50, color: Colors.grey[800]),
        ],
      ),
    );
  }

  Widget _buildChart() {
    final myData = controller.seriesData();
    if (myData.length == 0) return Container();

    final style = TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    );
    final length = myData.length;
    final formater = NumberFormat("#,###");
    bool showTitle = false;
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        padding: EdgeInsets.only(right: 30, left: 5, top: 24, bottom: 12),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (_) {
                return FlLine(color: Colors.grey[200], strokeWidth: 1);
              },
              getDrawingVerticalLine: (_) {
                return FlLine(color: Colors.grey[200], strokeWidth: 1);
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey[300], width: 1),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 8,
                getTextStyles: (_) => style,
                margin: 18,
                getTitles: (value) {
                  final number = value.toInt();
                  if (number >= myData.length) return '';
                  if (number == 0) return myData[number]['x'];
                  if (number == length - 1) return myData[number]['x'];
                  if (length > 30 && number > length - 5)
                    return myData[number]['x'];
                  return '';
                },
              ),
              leftTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) => style,
                getTitles: (value) {
                  showTitle = !showTitle;
                  if (showTitle) return formater.format(value);
                  return '';
                },
                reservedSize: 50,
                margin: 10,
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List<FlSpot>.generate(
                  myData.length,
                  (i) => FlSpot(i + 0.0, myData[i]['y'] + 0.0),
                ),
                isCurved: true,
                colors: [myData[0]['color']],
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
              ),
            ],
            lineTouchData: LineTouchData(
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: myData[0]['color'],
                tooltipPadding: EdgeInsets.all(5),
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                  return touchedBarSpots.map((point) {
                    final i = point.x.toInt();
                    return LineTooltipItem(
                      'Data: ${myData[i]["x"]}' +
                          '\nValor: ${formater.format(myData[i]["y"])}',
                      TextStyle(color: Colors.grey[50], fontSize: 12),
                    );
                  }).toList();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
