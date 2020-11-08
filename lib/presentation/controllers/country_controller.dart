import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  CountryController(this.dataController);

  CovidDataController dataController;
  CountrySummary _countrySummary;

  CountrySummary get getCountrySummary => _countrySummary;

  Future<bool> getCountryData(String countryName) async {
    _countrySummary = await dataController.getCountryData(countryName);
    return Future.value(true);
  }
}
