import 'package:flutter/material.dart';

import 'cores_const.dart';

class TemaLevaAi {
  ThemeData obter() {
    return ThemeData(
      fontFamily: 'Verdana',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CoresConst.azulPadrao,
      buttonColor: CoresConst.verdepadrao,
      unselectedWidgetColor: Colors.white,
      buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: double.infinity,
          buttonColor: CoresConst.verdepadrao,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary),
    );
  }
}
