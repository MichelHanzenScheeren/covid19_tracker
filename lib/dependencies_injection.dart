import 'package:covid19_tracker_in_flutter/data/repositories/country_repository.dart';
import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/data/services/sqflite_service.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/country_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/country_use_case.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:get/get.dart';

class DependenciesInjection {
  DependenciesInjection._();

  static void init() {
    //! Services
    Get.put(RequestService());
    Get.put(SQFliteService());

    //! Repositories
    Get.put<CovidContract>(CovidRepository(Get.find()));
    Get.put<CountryContract>(CountryRepository(Get.find()));

    //! Use cases
    Get.put(CovidUseCase(Get.find()));
    Get.put(CountryUseCase(Get.find()));

    //! Controllers
    Get.put(CovidDataController(Get.find(), Get.find()), permanent: true);
  }
}
