class Coordinate {
  double latitude;
  double longitude;

  Coordinate.fromMap(Map map) {
    latitude = map["lat"] + 0.0;
    longitude = map["long"] + 0.0;
  }
}
