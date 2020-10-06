import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:dio/dio.dart';

enum Period { today, yesterday, twoDaysAgo }

const BASE_URL = 'https://disease.sh/v3/covid-19';

class Covid19Api {
  Future<Map<String, dynamic>> worldSummary() async {
    final String request = BASE_URL + '/all';
    return await _doRequest(request);
  }

  Future<List<Map<String, dynamic>>> continentsSummary() async {
    final String request = BASE_URL + '/continents';
    final List response = await _doRequest(request);
    return _generateList(response);
  }

  List<Map<String, dynamic>> _generateList(List response) {
    return List<Map<String, dynamic>>.generate(
      response.length,
      (i) => Map<String, dynamic>.from(response[i]),
    );
  }

  Future<Map<String, dynamic>> findContinentSummary(String continent) async {
    _validateStringParameter(continent);
    final String request = '$BASE_URL/continents/$continent';
    return await _doRequest(request);
  }

  _validateStringParameter(String parameter) {
    if (parameter == null || parameter == '')
      throw ApiException(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  Future<List<Map<String, dynamic>>> countriesSummary() async {
    final String request = BASE_URL + '/countries';
    final List response = await _doRequest(request);
    return _generateList(response);
  }

  Future<Map<String, dynamic>> findCountrySummary(
    String country,
    Period period,
  ) async {
    _validateStringParameter(country);
    _validatePeriodParameter(period);
    final String request = '$BASE_URL/countries/$country${getPeriod(period)}';
    return await _doRequest(request);
  }

  _validatePeriodParameter(Period period) {
    if (period == null)
      throw ApiException(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  String getPeriod(Period period) {
    if (period == Period.yesterday) return '?yesterday=true';
    if (period == Period.twoDaysAgo) return '?twoDaysAgo=true';
    return '';
  }

  Future<Map<String, dynamic>> worldHistorical(String numberOfDays) async {
    _validateNumberOfDays(numberOfDays);
    final String request = '$BASE_URL/historical/all?lastdays=$numberOfDays';
    return await _doRequest(request);
  }

  void _validateNumberOfDays(String days) {
    if (days == 'all') return;
    if (days == null || int.tryParse(days) == null || int.parse(days) <= 0)
      throw ApiException(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
  }

  Future<Map<String, dynamic>> countryHistorical(
    String country,
    String numberOfDays,
  ) async {
    _validateStringParameter(country);
    _validateNumberOfDays(numberOfDays);
    final request = '$BASE_URL/historical/$country?lastdays=$numberOfDays';
    return await _doRequest(request);
  }

  Future<dynamic> _doRequest(String request) async {
    try {
      final Response response = await Dio().get(request);
      return _validateResponse(response);
    } catch (error) {
      _onError(error);
      return null;
    }
  }

  dynamic _validateResponse(Response response) {
    if (response == null || response.statusCode != 200) return null;
    return response.data;
  }

  void _onError(error) {
    if (error.runtimeType == DioError)
      throw ApiException(dioErrorType: error.type);
    throw ApiException();
  }
}
