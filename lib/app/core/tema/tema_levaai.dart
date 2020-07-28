import 'package:flutter/material.dart';

import 'cores_const.dart';

class TemaLevaAi {
  ThemeData obter() {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ColorsConst.azulPadrao,
      buttonColor: ColorsConst.verdepadrao,
      buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: double.infinity,
          buttonColor: ColorsConst.verdepadrao,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary),
    );
  }
}
