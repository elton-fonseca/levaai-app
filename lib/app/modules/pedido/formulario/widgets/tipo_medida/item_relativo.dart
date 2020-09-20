import 'package:flutter/material.dart';
import '../../../../../core/tema/cores_const.dart';
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

  Widget contador(
      {@required BuildContext context,
      @required VoidCallback onClickMais,
      @required VoidCallback onClickMenos,
      @required int quantidade}) {
    return Row(children: <Widget>[
      GestureDetector(
          onTap: onClickMenos,
          child: Image.asset("assets/imagens/item-menos.png",
              width: displayWidth(context) * 0.06)),
      Padding(
        padding: EdgeInsets.only(
            left: displayWidth(context) * 0.02,
            right: displayWidth(context) * 0.02),
        child: Text(
          quantidade.toString(),
          style: TextStyle(
            color: CoresConst.azulPadrao,
            fontSize: displayWidth(context) * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GestureDetector(
          onTap: onClickMais,
          child: Image.asset("assets/imagens/item-mais.png",
              width: displayWidth(context) * 0.06)),
    ]);
  }
}
