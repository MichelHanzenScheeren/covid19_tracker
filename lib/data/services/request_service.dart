import 'package:covid19_tracker_in_flutter/data/errors/covid19_api_error.dart';
import 'package:dio/dio.dart';

class RequestService {
  Future<dynamic> request(String request) async {
    try {
      final Response response = await Dio().get(request);
      return _validateResponse(response);
    } catch (error) {
      _onError(error);
      return null;
    }
  }

  dynamic _validateResponse(Response response) {
    if (response == null || response.statusCode != 200)
      throw Covid19ApiError(apiErrorType: ApiErrorType.INVALID_RESPONSE);
    return response.data;
  }

  void _onError(error) {
    if (error.runtimeType == DioError)
      throw Covid19ApiError(dioErrorType: error.type);
    throw Covid19ApiError();
  }
}
