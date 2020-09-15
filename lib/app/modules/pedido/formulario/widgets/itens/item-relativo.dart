import 'package:flutter/material.dart';
import '../../../../../core/view/tamanhos_relativos.dart';

class ItemRelativo {
  List<Widget> imagem({
    @required BuildContext context,
    @required String imagem,
    @required String descricao,
  }) {
    return <Widget>[
      Text(
        'TAMANHO'
        '\nAPROXIMADO',
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey,
          fontSize: displayWidth(context) * 0.025,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      Image(
        image: AssetImage(imagem),
      ),
      Text(
        descricao,
        style: TextStyle(
          fontFamily: 'Roboto',
          color: Colors.grey,
          fontSize: displayWidth(context) * 0.025,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }
}
