import 'package:flutter/cupertino.dart';

extension MediaQueryExtension on BuildContext {
  Size get mSize => MediaQuery.of(this).size;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
