import 'package:covid19_tracker_in_flutter/presentation/controllers/covid_data_controller.dart';
import 'package:get/get.dart';

class HistoricController extends GetxController {
  HistoricController(this.dataController);

  CovidDataController dataController;
  RxString _search = ''.obs;

  String get getSearch => _search.value;
  bool get showClearButton => _search.value.isNotEmpty;
  void changeSearchValue(String value) => _search.value = value;

  List<String> get countriesNames {
    final allNames = dataController.getAllCountriesNames;
    final fav = dataController.favoriteCountries.map((e) => e.name).toList()
      ..sort((a, b) => b.compareTo(a));
    final names = allNames.where((e) => !isFavorite(e) && inSearch(e)).toList();
    fav.where((e) => inSearch(e)).forEach((e) => names.insert(0, e));
    return names;
  }

  bool isFavorite(String name) {
    return dataController.favoriteCountries.any((e) => e.name == name);
  }

  bool inSearch(String value) {
    if (getSearch.isEmpty) return true;
    if (value.toLowerCase().contains(getSearch.toLowerCase())) return true;
    return false;
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
