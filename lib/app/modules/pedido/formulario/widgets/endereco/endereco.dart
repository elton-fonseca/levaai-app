import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'endereco_controller.dart';

class Endereco {
  Widget obter({
    @required BuildContext context,
    @required TextEditingController origemTextController,
    @required TextEditingController destinoTextController,
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
                  controller: origemTextController,
                  onChanged: (valor) => Modular.get<EnderecoController>()
                      .defineEnderecoOrigem(valor),
                  onTap: () {
                    Modular.get<EnderecoController>().mostraMapa(
                        context: context,
                        textController: origemTextController,
                        nome: 'endereco_origem');
                  },
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
                  controller: destinoTextController,
                  onChanged: (valor) => Modular.get<EnderecoController>()
                      .defineEnderecoDestino(valor),
                  onTap: () {
                    Modular.get<EnderecoController>().mostraMapa(
                        context: context,
                        textController: destinoTextController,
                        nome: 'endereco_destino');
                  },
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
