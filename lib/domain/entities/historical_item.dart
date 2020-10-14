class HistoricalItem {
  DateTime date;
  int value;

  HistoricalItem(Map<String, dynamic> map) {
    date = map['date'];
    value = map['value'];
  }
}
