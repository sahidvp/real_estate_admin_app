import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  // Get screen width
  double getWidthpercentage(double percentage) {
    return MediaQuery.of(context).size.width * (percentage / 100);
  }
  double getWidth(double percentage) {
    return MediaQuery.of(context).size.width ;
  }

  // Get screen height
  double getHeightpercentage(double percentage) {
    return MediaQuery.of(context).size.height * (percentage / 100);
  }

  double getHeight() {
    return MediaQuery.of(context).size.height ;
  }
}
