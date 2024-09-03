import 'package:flutter/material.dart';

extension SpaceExtension on int {
  Widget get horizontalSpace => SizedBox(width: toDouble());
  Widget get verticalSpace => SizedBox(height: toDouble());
}

extension PaddingExtension on int {
  EdgeInsetsGeometry get paddingAll => EdgeInsets.all(toDouble());
  EdgeInsetsGeometry get paddingTop => EdgeInsets.only(top: toDouble());
  EdgeInsetsGeometry get paddingBottom => EdgeInsets.only(bottom: toDouble());
  EdgeInsetsGeometry get paddingRight => EdgeInsets.only(right: toDouble());
  EdgeInsetsGeometry get paddingLeft => EdgeInsets.only(left: toDouble());
  EdgeInsetsGeometry get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsetsGeometry get paddingVertical =>
      EdgeInsets.symmetric(vertical: toDouble());
}

extension PaddingExt on (int, int) {
  EdgeInsetsGeometry get paddingSymmetric => EdgeInsets.symmetric(
      horizontal: this.$1.toDouble(), vertical: this.$2.toDouble());
}

extension DurationExtension on int {
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get microseconds => Duration(microseconds: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
}
