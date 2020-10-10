import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/dependencies_injection.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Teste das injeções de dependências', () {
    setUp(() {
      DependenciesInjection.init();
    });
    test('Teste injeção de dependência RequestService', () {
      RequestService requestService = Get.find();
      expect(requestService, isInstanceOf<RequestService>());
    });
    test('Teste injeção de dependência CovidContract', () {
      CovidContract covidContract = Get.find();
      expect(covidContract, isInstanceOf<CovidContract>());
    });
    test('Teste injeção de dependência CovidUseCase', () {
      CovidUseCase covidUseCase = Get.find();
      expect(covidUseCase, isInstanceOf<CovidUseCase>());
    });
  });
}
