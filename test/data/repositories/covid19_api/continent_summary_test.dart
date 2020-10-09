import 'package:covid19_tracker_in_flutter/data/models/continent_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid19_api.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Validação de continentsSummary() da classe covid19Api',
    () async {
      final covid19Api = Covid19Api(RequestService());
      final response = await covid19Api.continentsSummary();
      expect(response, isInstanceOf<List<ContinentSummaryModel>>());
    },
  );
}
