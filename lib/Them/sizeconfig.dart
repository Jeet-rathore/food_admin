import 'package:flutter/widgets.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockWidth;
  static late double blockHeight;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;

  static bool _initialized = false;

  static void init(BuildContext context) {
    if (_initialized) return;

    final mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;

    blockWidth = screenWidth / 100;
    blockHeight = screenHeight / 100;

    textMultiplier = blockHeight;
    imageSizeMultiplier = blockWidth;
    heightMultiplier = blockHeight;

    _initialized = true;
  }

  static double getProportionalWidth(BuildContext context, double inputWidth) {
    init(context);
    return (inputWidth / 375.0) * screenWidth;
  }

  static double getProportionalHeight(
    BuildContext context,
    double inputHeight,
  ) {
    init(context);
    return (inputHeight / 812.0) * screenHeight;
  }
}
