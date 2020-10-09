import 'package:covid19_tracker_in_flutter/data/errors/covid19_api_error.dart';
import 'package:covid19_tracker_in_flutter/data/models/continent_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/models/country_summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/models/historical_model.dart';
import 'package:covid19_tracker_in_flutter/data/models/summary_model.dart';
import 'package:covid19_tracker_in_flutter/data/services/request_service.dart';
import 'package:covid19_tracker_in_flutter/domain/contracts/covid19_api_contract.dart';

const BASE_URL = 'https://disease.sh/v3/covid-19';

class Covid19Api implements Covid19ApiContract {
  RequestService _service;

  Covid19Api(RequestService requestService) {
    _service = requestService;
  }

  Future<SummaryModel> worldSummary() async {
    final String request = BASE_URL + '/all';
    return SummaryModel.fromMap(await _service.request(request));
  }

  Future<List<ContinentSummaryModel>> continentsSummary() async {
    final String request = BASE_URL + '/continents';
    final List response = await _service.request(request);
    return List.generate(
      response.length,
      (index) => ContinentSummaryModel.fromMap(response[index]),
    );
  }

  Future<ContinentSummaryModel> findContinentSummary(String continent) async {
    _validateStringParameter(continent);
    final String request = '$BASE_URL/continents/$continent';
    return ContinentSummaryModel.fromMap(await _service.request(request));
  }

  _validateStringParameter(String parameter) {
    if (parameter == null || parameter == '')
      throw Covid19ApiError(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  Future<List<CountrySummaryModel>> countriesSummary() async {
    final String request = BASE_URL + '/countries';
    final List response = await _service.request(request);
    return List.generate(
      response.length,
      (index) => CountrySummaryModel.fromMap(response[index]),
    );
  }

  Future<CountrySummaryModel> findCountrySummary(
    String country,
    Period period,
  ) async {
    _validateStringParameter(country);
    _validatePeriodParameter(period);
    final String request = '$BASE_URL/countries/$country${getPeriod(period)}';
    return CountrySummaryModel.fromMap(await _service.request(request));
  }

  _validatePeriodParameter(Period period) {
    if (period == null)
      throw Covid19ApiError(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  String getPeriod(Period period) {
    if (period == Period.yesterday) return '?yesterday=true';
    if (period == Period.twoDaysAgo) return '?twoDaysAgo=true';
    return '';
  }

  Future<HistoricalModel> worldHistorical(String numberOfDays) async {
    _validateNumberOfDays(numberOfDays);
    final String request = '$BASE_URL/historical/all?lastdays=$numberOfDays';
    return HistoricalModel.fromMap(await _service.request(request));
  }

  void _validateNumberOfDays(String days) {
    if (days == 'all') return;
    if (days == null || int.tryParse(days) == null || int.parse(days) <= 0)
      throw Covid19ApiError(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  Future<HistoricalModel> countryHistorical(
    String country,
    String numberOfDays,
  ) async {
    _validateStringParameter(country);
    _validateNumberOfDays(numberOfDays);
    final request = '$BASE_URL/historical/$country?lastdays=$numberOfDays';
    return HistoricalModel.fromMap(await _service.request(request));
  }
}
