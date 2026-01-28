import 'package:evently_app/utils/size_config.dart';

double w(double value) {
  return value * SizeConfig.screenWidth / 375;
}

double h(double value) {
  return value * SizeConfig.screenHeight / 812;
}

double sp(double fontSize) => fontSize * SizeConfig.screenWidth / 375;
