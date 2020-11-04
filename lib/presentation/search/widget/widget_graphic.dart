import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Graphic extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  Graphic(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory Graphic.withSampleData() {
    return new Graphic(
      _createSampleData(),
      animate: false,
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

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];


    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Casos',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Óbitos',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      ),
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}