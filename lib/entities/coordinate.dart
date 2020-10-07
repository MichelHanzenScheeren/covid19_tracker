class Coordinate {
  double latitude;
  double longitude;

  Coordinate(Map<String, dynamic> map) {
    latitude = map["lat"];
    longitude = map["long"];
  }
}
