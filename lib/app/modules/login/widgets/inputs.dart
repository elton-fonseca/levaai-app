import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/tamanhos_relativos.dart';

class Input {
  Widget texto({
    BuildContext context,
    String placeholder,
    String Function(String) validador,
    void Function(String) onChange,
  }) {
    return TextFormField(
      validator: validador,
      onChanged: onChange,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC4C4C4), width: 1.0),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
        ),
        contentPadding: EdgeInsets.only(left: 20),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: Color(0xFFC4C4C4),
          fontSize: displayWidth(context) * 0.032,
        ),
      ),
    );
  }

  Widget botao({BuildContext context, String label, VoidCallback onClick}) {
    return Container(
      width: displayWidth(context) * 0.8,
      height: displayHeight(context) * 0.07,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: CoresConst.verdepadrao,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 3,
            color: CoresConst.verdepadrao,
          )),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "ENTRAR",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          onPressed: onClick,
        ),
      ),
    );
  }
}
