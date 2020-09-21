import 'package:flutter/material.dart';

import 'tamanhos_relativos.dart';

class Helpers {
  Helpers();

  Helpers.snackLevaai(
      {@required String texto, @required BuildContext context}) {
    var scnackbar = SnackBar(
      content: Text(texto),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 7),
    );
    Scaffold.of(context).showSnackBar(scnackbar);
  }

  Widget inputCadastros({
    @required BuildContext context,
    @required String placeholder,
    @required void Function(String) onChange,
    TextInputType teclado = TextInputType.text,
    bool senha = false,
  }) {
    return TextFormField(
      obscureText: senha,
      onChanged: onChange,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black,
        fontSize: displayWidth(context) * 0.04,
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: Colors.grey[700],
            width: 4,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 20),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey[400],
          fontSize: displayWidth(context) * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
