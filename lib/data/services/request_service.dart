import 'dart:async';

import 'package:covid19_tracker_in_flutter/data/errors/request_error.dart';
import 'package:dio/dio.dart';

class RequestService {
  Future<dynamic> request(String request) async {
    try {
      final Response response =
          await Dio().get(request).timeout(Duration(seconds: 5));
      return _validateResponse(response);
    } catch (error) {
      throw _onError(error);
    }
  }

  dynamic _validateResponse(Response response) {
    if (response == null || response.statusCode != 200)
      throw RequestError(apiErrorType: RequestErrorType.INVALID_RESPONSE);
    return response.data;
  }

  RequestError _onError(error) {
    if (error.runtimeType == DioError)
      return RequestError(dioErrorType: error.type);
    if (error.runtimeType == TimeoutException)
      return RequestError(apiErrorType: RequestErrorType.NETWORK_ERROR);
    return RequestError();
  }
}
