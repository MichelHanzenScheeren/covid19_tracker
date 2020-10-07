class Coordinate {
  double latitude;
  double longitude;

  Coordinate(Map<String, dynamic> map) {
    latitude = map["latitude"];
    longitude = map["longitude"];
  }
}
