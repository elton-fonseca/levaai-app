import 'package:flutter/material.dart';

import 'cores_const.dart';

class TemaLevaAi {
  ThemeData obter() {
    return ThemeData(
      fontFamily: 'Google',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CoresConst.azulPadrao,
      buttonColor: CoresConst.verdepadrao,
      buttonTheme: ButtonThemeData(
          height: 50,
          minWidth: double.infinity,
          buttonColor: CoresConst.verdepadrao,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          textTheme: ButtonTextTheme.primary),
    );
  }
}
