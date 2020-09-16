import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/Stores/pedido_lista_store.dart';
import '../../../../../core/view/tamanhos_relativos.dart';

class Endereco {
  Widget obter({
    @required BuildContext context,
    @required int indice,
    @required TextEditingController origem,
    @required TextEditingController destino,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          left: displayWidth(context) * 0.04,
          top: displayHeight(context) * 0.02),
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: displayHeight(context) * 0.13,
              child:
                  Image(image: AssetImage('assets/imagens/origem-destino.png')),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: displayWidth(context) * 0.02,
              top: displayHeight(context) * 0.01),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: displayWidth(context) * 0.85,
                height: displayHeight(context) * 0.1,
                child: TextFormField(
                  controller: origem,
                  onChanged: (valor) => Modular.get<PedidoListaStore>()
                      .defineEndereco(valor, indice),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                    fontSize: displayWidth(context) * 0.032,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: displayWidth(context) * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                    labelText: 'Origem',
                    hintText: 'Avenida Paulista, 234',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: displayWidth(context) * 0.85,
                height: displayHeight(context) * 0.1,
                child: TextFormField(
                  controller: destino,
                  onChanged: (valor) => Modular.get<PedidoListaStore>()
                      .defineEndereco(valor, indice),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey[600],
                    fontSize: displayWidth(context) * 0.032,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: displayWidth(context) * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                    labelText: 'Destino',
                    hintText: 'Avenida Faria lima, 344',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
