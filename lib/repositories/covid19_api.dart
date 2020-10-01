import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:dio/dio.dart';

const BASE_URL = 'https://disease.sh/v3/covid-19';

class Covid19Api {
  Future<Map<String, dynamic>> worldSummary() async {
    final String request = BASE_URL + '/all';
    return await _doRequest(request);
  }

  Future<List<Map<String, dynamic>>> continentsSummary() async {
    final String request = BASE_URL + '/continents';
    final List response = await _doRequest(request);
    return List.generate(
      response.length,
      (i) => Map<String, dynamic>.from(response[i]),
    );
  }

  Future<Map<String, dynamic>> findContinentSummary(String continent) async {
    _validateParameter(continent);
    final String request = '$BASE_URL/continents/$continent';
    return await _doRequest(request);
  }

  _validateParameter(String parameter) {
    if (parameter == null || parameter == '')
      throw ApiException(apiErrorType: ApiErrorType.INVALID_ARGUMENT);
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
