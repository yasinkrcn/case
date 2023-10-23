import 'package:case_voco/src/core/error/failure/failure.dart';
import 'package:case_voco/src/core/extensions/string_extension.dart';

class LocationError extends Failure {
  LocationError({String? errorText}) : super(errorText: errorText);

  @override
  String get message => errorText.getValueOrDefault;
}
