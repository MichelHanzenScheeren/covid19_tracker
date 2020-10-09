import 'package:covid19_tracker_in_flutter/data/models/continent_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Validação de continentsSummary() da classe covid19Api',
    () async {
      final covid19Api = CovidRepository(RequestService());
      final response = await covid19Api.continentsSummary();
      expect(response, isInstanceOf<List<ContinentSummaryModel>>());
    },
  );
}
