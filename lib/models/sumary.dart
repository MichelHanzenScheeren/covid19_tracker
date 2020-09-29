class Sumary {
  DateTime updatedDate;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int todayRecovered;
  int active;
  int critical;
  int population;

  Sumary.fromMap(Map map) {
    updatedDate = DateTime.fromMillisecondsSinceEpoch(map["updated"]);
    cases = map["cases"];
    todayCases = map["todayCases"];
    deaths = map["deaths"];
    todayDeaths = map["todayDeaths"];
    recovered = map["recovered"];
    todayRecovered = map["todayRecovered"];
    active = map["active"];
    critical = map["critical"];
    population = map["population"];
  }
}
