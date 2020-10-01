class Coordinate {
  double latitude;
  double longitude;

  Coordinate.fromMap(Map map) {
    latitude = map["lat"];
    longitude = map["long"];
  }
}
