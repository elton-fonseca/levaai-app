import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'complemento_endereco_controller.dart';
import 'endereco_controller.dart';

class Endereco {
  Widget obter({
    @required BuildContext context,
    @required TextEditingController origemTextController,
    @required TextEditingController origemNumeroTextController,
    @required TextEditingController origemComplementoTextController,
    @required TextEditingController destinoTextController,
    @required TextEditingController destinoNumeroTextController,
    @required TextEditingController destinoComplementoTextController,
  }) {
    return Padding(
      padding: EdgeInsets.only(
          left: displayWidth(context) * 0.04,
          top: displayHeight(context) * 0.02),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: displayHeight(context) * 0.13,
                child: Image(
                    image: AssetImage('assets/imagens/origem-destino.png')),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: displayWidth(context) * 0.02,
                top: displayHeight(context) * 0.01),
            child: Column(
              children: <Widget>[
                //campos cep e rua
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.06,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.28,
                            height: displayHeight(context) * 0.07,
                            child: TextFormField(
                              controller: origemNumeroTextController,
                              onChanged: (value) {
                                Modular.get<ComplementoEnderecoController>()
                                    .defineNumeroEnderecoOrigem(value);
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
                                labelText: 'CEP Origem',
                                hintText: 'Digite o CEP',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.5,
                          height: displayHeight(context) * 0.07,
                          child: TextFormField(
                            controller: origemComplementoTextController,
                            onChanged: (value) {
                              Modular.get<ComplementoEnderecoController>()
                                  .defineComplementoEnderecoOrigem(value);
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
                              labelText: 'Rua origem',
                              hintText: 'Digite a rua',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                //campos numero e complemento
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.05   
                            ,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.31,
                            height: displayHeight(context) * 0.1,
                            child: TextFormField(
                              controller: origemNumeroTextController,
                              onChanged: (value) {
                                Modular.get<ComplementoEnderecoController>()
                                    .defineNumeroEnderecoOrigem(value);
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
                                labelText: 'Número',
                                hintText: 'Núm e complemento',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.49,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            controller: origemComplementoTextController,
                            onChanged: (value) {
                              Modular.get<ComplementoEnderecoController>()
                                  .defineComplementoEnderecoOrigem(value);
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
                              labelText: 'Bairro',
                              hintText: 'Digite o Bairro',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.06,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.4,
                            height: displayHeight(context) * 0.1,
                            child: Text("aaa"),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.4,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            controller: origemComplementoTextController,
                            onChanged: (value) {
                              Modular.get<ComplementoEnderecoController>()
                                  .defineComplementoEnderecoOrigem(value);
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
                              labelText: 'Bairro',
                              hintText: 'Digite o Bairro',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: displayWidth(context) * 0.85,
                  height: displayHeight(context) * 0.085,
                  child: TextFormField(
                    controller: destinoTextController,
                    onChanged: (valor) => Modular.get<EnderecoController>()
                        .defineEnderecoDestino(valor),
                    onTap: () {},
                    readOnly: true,
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
                      labelText: 'Rua de Destino',
                      hintText: 'Endereço de Destino',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.06,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.28,
                            height: displayHeight(context) * 0.1,
                            child: TextFormField(
                              controller: destinoNumeroTextController,
                              onChanged: (value) {
                                Modular.get<ComplementoEnderecoController>()
                                    .defineNumeroEnderecoDestino(value);
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
                                labelText: 'Número',
                                hintText: 'Digite o numero',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.5,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            controller: destinoComplementoTextController,
                            onChanged: (value) {
                              Modular.get<ComplementoEnderecoController>()
                                  .defineComplementoEnderecoDestino(value);
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
                              labelText: 'Complemento ou referência',
                              hintText: 'Digite o complemento',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
