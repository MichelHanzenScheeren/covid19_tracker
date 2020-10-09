import 'package:covid19_tracker_in_flutter/data/repositories/covid_repository.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid_contract.dart';
import 'package:covid19_tracker_in_flutter/domain/use_cases/covid_use_case.dart';
import 'package:get/get.dart';

class DependenciesInjection {
  DependenciesInjection._();

  static void init() {
    //! Services
    Get.lazyPut(() => RequestService());

    //! Repositories
    Get.lazyPut<CovidContract>(() => CovidRepository(Get.find()));

    //! Use cases
    Get.lazyPut(() => CovidUseCase(Get.find()));
  }
}
