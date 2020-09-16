import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/Stores/pedido_lista_store.dart';
import 'package:levaai1/app/core/tema/cores_const.dart';
import '../../../../../../main.dart';
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
      IconButton(
        icon: Icon(
          Icons.remove_circle,
          color: Colors.grey,
          size: displayWidth(context) * 0.07,
        ),
        onPressed: onClickMenos,
      ),
      Padding(
        padding: EdgeInsets.only(left: displayWidth(context) * 0.01),
        child: Observer(
          builder: (_) {
            return Text(
              Modular.get<PedidoListaStore>().pedidos[0].caixaSapato.toString(),
              style: TextStyle(
                color: CoresConst.azulPadrao,
                fontSize: displayWidth(context) * 0.07,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.add_circle,
          color: Colors.grey,
          size: displayWidth(context) * 0.07,
        ),
        onPressed: onClickMais,
      ),
    ]);
  }
}
