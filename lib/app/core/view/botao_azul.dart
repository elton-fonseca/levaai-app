import 'package:flutter/material.dart';
import '../tema/cores_const.dart';
import 'tamanhos_relativos.dart';

class BotaoAzul extends StatelessWidget {
  const BotaoAzul({this.texto, this.onClick, this.largura = 0.7});

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
          color: onClick == null
              ? CoresConst.azulPadrao.withOpacity(0.5)
              : CoresConst.azulPadrao,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 3,
            color: onClick == null ? Colors.transparent : CoresConst.azulPadrao,
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
