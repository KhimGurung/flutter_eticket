
class CustomException implements Exception{
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException{
  FetchDataException([String message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException{
  BadRequestException([message]) : super(message, "Inavlid Request: ");
}

class UnauthorisedException extends CustomException{
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class ForbiddenException extends CustomException{
  ForbiddenException([message]) : super(message, "Forbidden: ");
}

class InterServerErrorException extends CustomException{
  InterServerErrorException([message]) : super(message, "Internal Server Error: ");
}

class InvalidInputException extends CustomException{
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}