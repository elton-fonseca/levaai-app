import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/pedido.dart';
import '../../../../core/stores/pedido_lista_store.dart';
import '../../../../core/tema/cores_const.dart';
import '../../../../core/view/tamanhos_relativos.dart';

class GridItem {
  Widget obter(
      {@required BuildContext context,
      @required Pedido pedido,
      @required int indice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: displayWidth(context) * 0.00),
          child: Container(
            height: displayHeight(context) * 0.22,
            width: displayHeight(context) * 0.22,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(const Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: CoresConst.azulPadrao.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.04,
                      bottom: displayWidth(context) * 0.01,
                      top: displayWidth(context) * 0.04),
                  child: Text(
                    'Pedido #1',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.grey[500],
                      fontSize: displayWidth(context) * 0.04,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: displayWidth(context) * 0.05),
                  child: Container(
                    height: displayHeight(context) * 0.05,
                    width: displayWidth(context) * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0xFFf7f9f8),
                      borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(40.0),
                        bottomRight: const Radius.circular(40.0),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.monetization_on,
                              color: Color(0xFFC4C4C4)),
                          iconSize: displayWidth(context) * 0.05,
                          onPressed: () {
                            null;
                          },
                        ),
                        Text(
                          'R\$200,00',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: CoresConst.azulPadrao,
                            fontSize: displayWidth(context) * 0.04,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: displayWidth(context) * 0.04,
                      top: displayWidth(context) * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        pedido.enderecoOrigem,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey[500],
                          fontSize: displayWidth(context) * 0.03,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Modular.to.popAndPushNamed(
                                '/pedido/formulario/$indice/editar');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: displayWidth(context) * 0.04,
                              top: displayWidth(context) * 0.03,
                            ),
                            child: SizedBox(
                              child: Icon(
                                Icons.edit,
                                size: displayWidth(context) * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Modular.get<PedidoListaStore>()
                                .pedidos
                                .removeAt(indice);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.03,
                              top: displayWidth(context) * 0.03,
                            ),
                            child: SizedBox(
                              width: displayWidth(context) * 0.045,
                              child: Image.asset("assets/imagens/delete.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
