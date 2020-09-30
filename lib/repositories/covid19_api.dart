import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:dio/dio.dart';

const BASE_URL = 'https://disease.sh/v3/covid-19';

class Covid19Api {
  Future<Map<String, dynamic>> worldSummary() async {
    String request = BASE_URL + '/all';
    return await _doRequest(request);
  }

  Future<Map<String, dynamic>> _doRequest(String request) async {
    return await Dio()
        .get(request)
        .then(_validateResponse)
        .catchError(_onError);
  }

  Map<String, dynamic> _validateResponse(Response response) {
    if (response == null || response.statusCode != 200) return null;
    return response.data;
  }

  void _onError(error) {
    throw ApiException(dioErrorType: error.type);
  }
}
