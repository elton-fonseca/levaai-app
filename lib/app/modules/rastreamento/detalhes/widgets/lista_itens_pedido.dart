import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/rastreamento/detalhes/detalhes_controller.dart';

import '../../../../core/view/tamanhos_relativos.dart';

class ListaItensPedido extends StatelessWidget {
  ListaItensPedido({this.itens});

  final List itens;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.3,
      child: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            var item = itens[index];
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: displayWidth(context) * 0.05,
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Quantidade: ${item["quantidade"]}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: displayWidth(context) * 0.05,
                    right: displayWidth(context) * 0.05,
                    bottom: displayWidth(context) * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Modular.get<DetalhesController>().descritivoItem(item),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: displayWidth(context) * 0.035,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: displayWidth(context) * 0.85,
                  child: Divider(
                    color: Colors.grey[300],
                    height: 2,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
