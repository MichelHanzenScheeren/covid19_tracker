class HistoricalItem {
  DateTime date;
  int value;

  HistoricalItem(String stringDate, int number) {
    List<int> dates = stringDate.split('/').map((e) => int.parse(e)).toList();
    dates[2] = int.parse('20${dates[2]}');
    date = DateTime(dates[2], dates[0], dates[1]);
    value = number;
  }
}
