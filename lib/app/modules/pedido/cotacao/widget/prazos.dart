import 'package:flutter/material.dart';
import '../../../../core/view/helpers.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class Prazos extends StatelessWidget {
  Prazos({
    this.imagem,
    this.tipo,
    this.prazo,
  });

  final String imagem;
  final String tipo;
  final int prazo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: displayWidth(context) * 0.025,
                right: displayWidth(context) * 0.025,
              ),
              child: SizedBox(
                width: displayWidth(context) * 0.1,
                child: Image.asset(imagem),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'PRAZO DE $tipo',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xFF909090),
                fontSize: displayWidth(context) * 0.035,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            Text(
              Helpers.prazoDescricao(prazo.toString(), tipo),
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xFF909090),
                fontSize: displayWidth(context) * 0.035,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }


}
