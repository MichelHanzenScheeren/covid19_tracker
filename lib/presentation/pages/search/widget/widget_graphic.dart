import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covid19_tracker_in_flutter/domain/entities/summary.dart';
import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Graphic(this.seriesList, {this.animate});

  factory Graphic.withSampleData(Summary summary) {
    return Graphic(
      _createSampleData(summary),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new charts.BarChart(
          seriesList,
          animate: animate,
          behaviors: [
            new charts.SeriesLegend(
                position: charts.BehaviorPosition.end, desiredMaxRows: 2)
          ],
        ));
  }

  static List<charts.Series<_SummaryItem, String>> _createSampleData(
      Summary summary) {
    // final totalData = [
    //   _SummaryItem('Casos', summary.cases),
    //   _SummaryItem('Recuperados', summary.recovered),
    //   _SummaryItem('Óbitos', summary.deaths),
    // ];

    final todayData = [
      _SummaryItem('Casos', summary.todayCases),
      _SummaryItem('Recuperados', summary.todayRecovered),
      _SummaryItem('Óbitos', summary.todayDeaths),
    ];

    return [
      // charts.Series<_SummaryItem, String>(
      //   id: 'Total',
      //   domainFn: (_SummaryItem sales, _) => sales.type,
      //   measureFn: (_SummaryItem sales, _) => sales.number,
      //   data: totalData,
      //   colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
      // ),
      charts.Series<_SummaryItem, String>(
        id: 'Novos',
        domainFn: (_SummaryItem sales, _) => sales.type,
        measureFn: (_SummaryItem sales, _) => sales.number,
        data: todayData,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }
}

class _SummaryItem {
  final String type;
  final int number;

  _SummaryItem(this.type, this.number);
}
