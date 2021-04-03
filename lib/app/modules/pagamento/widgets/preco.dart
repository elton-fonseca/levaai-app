import 'package:flutter/material.dart';

import '../../../core/view/helpers.dart';
import '../../../core/view/tamanhos_relativos.dart';

class Preco extends StatelessWidget {
  const Preco({this.valor, this.desconto, this.texto});

  final double valor;
  final double desconto;
  final String texto;

  @override
  Widget build(BuildContext context) {
    var valorOriginal;

    if (desconto > 0.001) {
      valorOriginal = Text(
        'R\$ ${Helpers.numeroBr(valor)}',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.white,
          fontSize: displayWidth(context) * 0.04,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.lineThrough,
        ),
      );
    } else {
      valorOriginal = Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Total Geral',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: displayWidth(context) * 0.04,
          ),
        ),
        Row(
          children: [
            Text(
              // ignore: lines_longer_than_80_chars
              'R\$ ${Helpers.numeroBr(valor - desconto)}',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: displayWidth(context) * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
            valorOriginal,
          ],
        ),
        Text(
          // ignore: lines_longer_than_80_chars
          texto,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontSize: displayWidth(context) * 0.03,
          ),
        ),
      ],
    );
  }
}
