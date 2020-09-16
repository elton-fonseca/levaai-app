import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/Stores/pedido_lista_store.dart';
import '../../../../../main.dart';
import '../../../../core/Models/pedido.dart';
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
        Container(
          height: displayHeight(context) * 0.4,
          width: displayHeight(context) * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: CoresConst.azulPadrao.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 15,
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
                    top: displayWidth(context) * 0.05),
                child: Text(
                  pedido.enderecoOrigem,
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
                        iconSize: displayWidth(context) * 0.06,
                        onPressed: () {
                          null;
                        },
                      ),
                      Text(
                        'R\$200,00',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: CoresConst.azulPadrao,
                          fontSize: displayWidth(context) * 0.045,
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
                    top: displayWidth(context) * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Modular.to
                            .pushNamed('/pedido/formulario/$indice/editar');
                      },
                      child: Text(
                        'editar:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF909090),
                          fontSize: displayWidth(context) * 0.032,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Modular.get<PedidoListaStore>()
                            .pedidos
                            .removeAt(indice);
                      },
                      child: Text(
                        'apagar:',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xFF909090),
                          fontSize: displayWidth(context) * 0.032,
                        ),
                      ),
                    ),
                    Text(
                      'CEP 12342-000',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF909090),
                        fontSize: displayWidth(context) * 0.032,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      right: displayWidth(context) * 0.02,
                    ),
                    child: SizedBox(
                      width: displayWidth(context) * 0.05,
                      child: Image.asset("assets/imagens/delete.png"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          width: displayWidth(context) * 0.03,
        ),
      ],
    );
  }
}
