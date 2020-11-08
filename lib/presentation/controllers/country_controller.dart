import 'package:covid19_tracker_in_flutter/domain/entities/country_summary.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:covid19_tracker_in_flutter/presentation/widgets/my_snackbar.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  CountryController(this.dataController);

  CovidDataController dataController;
  CountrySummary _countrySummary;

  CountrySummary get getCountrySummary => _countrySummary;

  Future<bool> getCountryData(String countryName) async {
    try {
      _countrySummary = await dataController.getCountryData(countryName);
      if (_countrySummary != null) return Future.value(true);
      return Future.value(false);
    } catch (erro) {
      MySnackBar(message: erro.toString());
      return Future.value(false);
    }
  }
}
