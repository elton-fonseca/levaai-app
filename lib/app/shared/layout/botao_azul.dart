import 'package:flutter/material.dart';

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
              color: Color(0xFFFFFFFF),
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
