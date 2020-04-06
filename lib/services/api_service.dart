import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttereticket/services/custom_exception.dart';

class APIService{
  final String _baseUrl = "";

  Future<dynamic> get(String url) async {
    var responseJson;
    try{
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    }on SocketException{
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic _response(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson = json.decode(response.body.toString());
        return(responseJson);
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnauthorisedException(response.body.toString());
      case 403:
        throw ForbiddenException(response.body.toString());
      case 500:
        throw InterServerErrorException(response.body.toString());
      default:
        throw FetchDataException("Error occured while communication with server with statuscode : ${response.statusCode}");
    }
  }

}