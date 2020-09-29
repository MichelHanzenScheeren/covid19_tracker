import 'package:covid19_tracker_in_flutter/repositories/api_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL = 'https://disease.sh/v3/covid-19';

class Covid19Api {
  Future<Map<String, dynamic>> worldSummary() async {
    String request = BASE_URL + '/all';
    return await _doRequest(request);
  }

  Future<Map<String, dynamic>> _doRequest(String request) async {
    return await http
        .get(request)
        .then(_decodeResponse)
        .timeout(Duration(seconds: 8))
        .catchError(_onError);
  }

  Map<String, dynamic> _decodeResponse(http.Response response) {
    if (response == null || response.statusCode != 200) return null;
    return json.decode(response.body);
  }

  void _onError(error) {
    throw ApiException();
  }
}
