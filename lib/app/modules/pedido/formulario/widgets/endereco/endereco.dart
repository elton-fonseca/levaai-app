import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'dropbox/dropdown_cidade.dart';
import 'endereco_controller.dart';

class Endereco {
  Widget obter({
    @required BuildContext context,
    @required String tipo,
    @required TextEditingController cepTextController,
    @required TextEditingController logradouroTextController,
    @required TextEditingController numeroTextController,
    @required TextEditingController bairroTextController,
    @required Future<dynamic> cidadesAtendidas,
    @required Function cepAcao,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: displayWidth(context) * 0.02,
                top: displayHeight(context) * 0.0),
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
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(9),
                              ],
                              controller: cepTextController,
                              onChanged: (value) {
                                cepAcao(value);
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
                                labelText: 'CEP',
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
                            controller: logradouroTextController,
                            onChanged: (value) {
                              Modular.get<EnderecoController>()
                                  .defineLogradouro(value, tipo);
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
                              labelText: 'Logradouro',
                              hintText: 'Digite o Logradouro',
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
                            right: displayWidth(context) * 0.05,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.31,
                            height: displayHeight(context) * 0.07,
                            child: TextFormField(
                              controller: numeroTextController,
                              onChanged: (value) {
                                Modular.get<EnderecoController>()
                                    .defineNumero(value, tipo);
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
                          height: displayHeight(context) * 0.07,
                          child: TextFormField(
                            controller: bairroTextController,
                            onChanged: (value) {
                              Modular.get<EnderecoController>()
                                  .defineBairro(value, tipo);
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
                            right: displayWidth(context) * 0.05,
                          ),
                          child: SizedBox(
                            width: displayWidth(context) * 0.556,
                            height: displayHeight(context) * 0.1,
                            child: Observer(
                              builder: (_) {
                                return FutureBuilder(
                                  future: cidadesAtendidas,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return DropdownCidade(
                                          snapshot.data, tipo);
                                    } else if (snapshot.hasError) {
                                      return Text("erro ao obter cidades");
                                    }
                                    return CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: displayWidth(context) * 0.25,
                          height: displayHeight(context) * 0.1,
                          child: TextFormField(
                            initialValue: 'São Paulo',
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
                              labelText: 'Estado',
                              hintText: 'Digite o estado',
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
