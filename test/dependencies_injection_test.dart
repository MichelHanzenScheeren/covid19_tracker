import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/data/services/sqflite_service.dart';
import 'package:covid19_tracker_in_flutter/dependencies_injection.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/country_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/country_use_case.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Testes injeção de dependências', () {
    setUp(() {
      DependenciesInjection.init();
    });
    group('Teste das injeções de dependências CovidApi', () {
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
    group('Teste das injeções de dependências Country Database', () {
      test('Teste injeção de dependência SQFliteService', () {
        SQFliteService sQFliteService = Get.find();
        expect(sQFliteService, isInstanceOf<SQFliteService>());
      });
      test('Teste injeção de dependência CountryContract', () {
        CountryContract countryContract = Get.find();
        expect(countryContract, isInstanceOf<CountryContract>());
      });
      test('Teste injeção de dependência CountryUseCase', () {
        CountryUseCase countryUseCase = Get.find();
        expect(countryUseCase, isInstanceOf<CountryUseCase>());
      });
    });
  });
}
