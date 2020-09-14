

import 'package:cloud_music/base_framework/exception/base_exception.dart';

/// data missing

class DataMissingException extends BaseException{
  DataMissingException({String message = "data missing"}) : super(message);

}