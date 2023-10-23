import 'package:case_voco/src/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

extension SizedBoxExtensionResponsive on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get heightR => SizedBox(height: this?.toDouble().h);
  Widget get widthR => SizedBox(width: this?.toDouble().w);
}

extension SizedBoxExtension on int? {
  int validate({int value = 0}) {
    return this ?? value;
  }

  Widget get height => SizedBox(height: this?.toDouble());
  Widget get width => SizedBox(width: this?.toDouble());
}
