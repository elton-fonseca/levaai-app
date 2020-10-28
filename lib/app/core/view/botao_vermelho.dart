import 'package:flutter/material.dart';
import 'tamanhos_relativos.dart';

class BotaoVermelho extends StatelessWidget {
  const BotaoVermelho({this.texto, this.onClick, this.largura = 0.7});

  final String texto;

  final VoidCallback onClick;

  final double largura;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * largura,
      height: displayHeight(context) * 0.07,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 3,
            color: Color(0xFFC13A1C),
          )),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                texto,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC13A1C),
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
