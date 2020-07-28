import 'package:flutter/material.dart';
import '../tema/cores_const.dart';

class BotaoAzul extends StatelessWidget {
  const BotaoAzul({this.onClick});

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Ver meus pedidos",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: CoresConst.azulPadrao,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      onPressed: onClick,
    );
  }
}
