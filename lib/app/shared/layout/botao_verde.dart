import 'package:flutter/material.dart';

class BotaoVerde extends StatelessWidget {
  const BotaoVerde({this.onClick});

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Realizar um pedido",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
