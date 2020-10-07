import 'package:covid19_tracker_in_flutter/entities/coordinate.dart';
import 'package:flutter_test/flutter_test.dart';

const coordinateModel = {
  "lat": -8.6599161,
  "long": 91.1469847,
};

main() {
  test('Validação da conversão da factory Coordinate.fromMap', () {
    final coordinate = Coordinate.fromMap(coordinateModel);
    expect(coordinate, isInstanceOf<Coordinate>());
    expect(coordinate.latitude, isInstanceOf<double>());
    expect(coordinate.longitude, isInstanceOf<double>());
  });
}
