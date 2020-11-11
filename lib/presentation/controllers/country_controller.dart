import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/widgets/my_snackbar.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  CountryController(this.dataController);

  CovidDataController dataController;
  Rx<CountrySummary> _countrySummary = Rx<CountrySummary>();

  CountrySummary get getCountrySummary => _countrySummary.value;

  Future<bool> getCountryData(String country) async {
    try {
      _countrySummary.value = await dataController.getCountryData(country);
      if (_countrySummary != null) return Future.value(true);
      return Future.value(false);
    } catch (erro) {
      MySnackBar(message: erro.toString());
      return Future.value(false);
    }
  }

  Future<void> updateCountryData(String country) async {
    dataController.redefineCountryData(country);
    await getCountryData(country);
  }
}
