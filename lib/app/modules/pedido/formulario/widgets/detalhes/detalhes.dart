import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/pedido/formulario/widgets/detalhes/detalhes_controller.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'dropbox/dropdown_peso.dart';
import 'dropbox/dropdown_tipo.dart';

class Detalhes {
  Widget obter(
      {@required BuildContext context,
      @required TextEditingController valorTotalTextController,
      @required TextEditingController pesoTextController,
      @required TextEditingController tipoMercadoriaTextController}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              right: displayWidth(context) * 0.025,
              left: displayWidth(context) * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  'Valor Total',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                    fontSize: displayWidth(context) * 0.032,
                  ),
                )
              ]),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: displayWidth(context) * 0.5,
                    child: TextFormField(
                      controller: valorTotalTextController,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[600],
                        fontSize: displayWidth(context) * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'R\$ 0,00',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey[600],
                          fontSize: displayWidth(context) * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 2,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: displayWidth(context) * 0.025,
              left: displayWidth(context) * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  'Peso total estimado',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                    fontSize: displayWidth(context) * 0.032,
                  ),
                )
              ]),
              Column(
                children: <Widget>[
                  SizedBox(
                    child: Observer(builder: (_) {
                      return DropdownPeso(pesoTextController);
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 2,
          thickness: 2,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: displayWidth(context) * 0.025,
              left: displayWidth(context) * 0.025),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(children: <Widget>[
                Text(
                  'Tipo',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                    fontSize: displayWidth(context) * 0.032,
                  ),
                )
              ]),
              Column(
                children: <Widget>[
                  SizedBox(
                    width: displayWidth(context) * 0.5,
                    child: TextFormField(
                      controller: tipoMercadoriaTextController,
                      onChanged: (v) => Modular.get<DetalhesController>()
                          .defineTipoMercadoria(v),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.grey[600],
                        fontSize: displayWidth(context) * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ex: Eletrônico',
                        hintStyle: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.grey[600],
                          fontSize: displayWidth(context) * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
