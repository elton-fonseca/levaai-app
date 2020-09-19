import 'package:flutter/material.dart';

class Helpers {
  Helpers.snackLevaai({@required String texto, BuildContext context}) {
    var scnackbar = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 7),
    );
    Scaffold.of(context).showSnackBar(scnackbar);
  }
}
