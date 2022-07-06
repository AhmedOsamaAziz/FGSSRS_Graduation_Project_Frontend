import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:premium_flow/app/data/helper/enums/response_status.dart';
import 'package:premium_flow/app/data/helper/generic_response.dart';

class NetWork {
  static const timeOutDuration = 20;

  // GET METHOD
  Future<GenericResponse> get(String baseUrl, String endPoint) async {
    var uri = Uri.parse('$baseUrl$endPoint');
    print(uri);
    try {
      http.Response response = await http.get(uri);
      return GenericResponse(
          status: response.statusCode.toString()[0] == '2'
              ? ResponseStatus.success
              : ResponseStatus.fail,
          obj: response,
          code: response.statusCode); //_processResponse(response);
    } on Exception catch (e) {
      return GenericResponse(
        status: ResponseStatus.fail,
        message: e.toString(),
      );
    }
  }

  // POST METHOD
  Future<GenericResponse> post(
      String baseUrl, String endPoint, dynamic payLoadObj) async {
    var uri = Uri.parse('$baseUrl$endPoint');
    payLoadObj = json.encode(payLoadObj);
    try {
      http.Response response = await http.post(uri, body: payLoadObj, headers: {
        'Content-Type': 'application/json'
      }); //.timeout(const Duration(seconds: timeOutDuration));
      return GenericResponse(
          obj: response,
          status: response.statusCode.toString()[0] == '2'
              ? ResponseStatus.success
              : ResponseStatus.fail,
          code: response.statusCode);
    } on Exception catch (e) {
      return GenericResponse(
        status: ResponseStatus.fail,
        message: e.toString(),
      );
    }
  }

  // PUT METHOD
  Future<GenericResponse> put(
      String baseUrl, String endPoint, dynamic payLoadObj) async {
    var uri = Uri.parse('$baseUrl$endPoint');
    payLoadObj = json.encode(payLoadObj);
    try {
      http.Response response = await http.put(uri,
          body: payLoadObj, headers: {'Content-Type': 'application/json'});
      //.timeout(const Duration(seconds: timeOutDuration));
      return GenericResponse(
          status: response.statusCode.toString()[0] == '2'
              ? ResponseStatus.success
              : ResponseStatus.fail,
          obj: response,
          code: response.statusCode);
    } on Exception catch (e) {
      return GenericResponse(
        status: ResponseStatus.fail,
        message: e.toString(),
      );
    }
  }

  // DELETE METHOD
  Future<dynamic> delete(
      String baseUrl, String endPoint, dynamic payLoadObj) async {
    var uri = Uri.parse(baseUrl + endPoint);
    payLoadObj = json.encode(payLoadObj);

    try {
      var response = await http
          .delete(uri, body: payLoadObj)
          .timeout(const Duration(seconds: timeOutDuration));
      return GenericResponse(
          status: response.statusCode.toString()[0] == '2'
              ? ResponseStatus.success
              : ResponseStatus.fail,
          obj: response,
          code: response.statusCode);
    } on Exception catch (e) {
      return GenericResponse(
        status: ResponseStatus.fail,
        message: e.toString(),
      );
    }
  }

  // dynamic _processResponse(http.Response response) {
  //   var json = utf8.decode(response.bodyBytes);
  //   var url = response.request?.url.toString();
  //
  //   switch (response.statusCode) {
  //     case 200:
  //     case 201:
  //       return json;
  //     case 400:
  //       throw BadRequestException(json, url);
  //     case 401:
  //     case 403:
  //       throw UnAuthorizedException(json, url);
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error occurred with code : ${response.statusCode}', url);
  //   }
  // }
}
