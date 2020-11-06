import 'package:covid19_tracker_in_flutter/domain/entities/country.dart';
import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:get/get.dart';

class HistoricController extends GetxController {
  HistoricController(this.dataController);

  CovidDataController dataController;

  List<String> get countriesNames {
    List<String> _countriesNames = List<String>();
    List<Country> favorites = dataController.favoriteCountries;
    final summarys = dataController.continentSummarys;
    for (final summary in summarys) {
      for (final country in summary.countries) {
        if (!favorites.any((e) => e.name == country))
          _countriesNames.add(country);
      }
    }
    _countriesNames.sort((a, b) => a.compareTo(b));
    favorites.sort((a, b) => b.name.compareTo(a.name));
    favorites.forEach((e) => _countriesNames.insert(0, e.name));
    return _countriesNames;
  }

  bool isFavorite(String name) {
    return dataController.favoriteCountries.any((e) => e.name == name);
  }

  Future<void> addOrRemoveFavorite(String name) async {
    try {
      if (isFavorite(name)) {
        final favorites = dataController.favoriteCountries;
        final country = favorites.where((e) => e.name == name)?.first;
        await dataController.removeFavorite(country?.id);
      } else {
        await dataController.addFavorite(name);
      }
    } catch (erro) {
      print(erro);
    }
  }
}
