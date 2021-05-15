import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/view/tamanhos_relativos.dart';
import 'endereco_controller.dart';

class Endereco {
  Widget obter({
    @required BuildContext context,
    @required String tipo,
    @required TextEditingController cepTextController,
    @required TextEditingController logradouroTextController,
    @required TextEditingController numeroTextController,
    @required TextEditingController complementoTextController,
    @required TextEditingController bairroTextController,
    @required Widget dropdownCidade,
    @required Function cepAcao,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
      child: Observer(
        builder: (_) {
          return Row(
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
                                width: displayWidth(context) * 0.22,
                                height: displayHeight(context) * 0.07,
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(9),
                                  ],
                                  keyboardType: TextInputType.number,
                                  controller: cepTextController,
                                  onChanged: (value) {
                                    cepAcao(value);
                                    if (value.length == 9) {
                                      numeroTextController.text = '';
                                    }
                                  },
                                  autofocus: true,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[600],
                                    fontSize: displayWidth(context) * 0.032,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                              width: displayWidth(context) * 0.59,
                              height: displayHeight(context) * 0.07,
                              child: TextFormField(
                                controller: logradouroTextController,
                                onChanged: (value) {
                                  Modular.get<EnderecoController>()
                                      .defineLogradouro(value, tipo);
                                },
                                onTap: () {
                                  Modular.get<EnderecoController>()
                                      .liberaReadOnly();
                                },
                                readOnly:
                                    Modular.get<EnderecoController>().readOnly,
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
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: displayWidth(context) * 0.05,
                              ),
                              child: SizedBox(
                                width: displayWidth(context) * 0.15,
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
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: displayWidth(context) * 0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    labelText: 'Número',
                                    hintText: 'Número',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: displayWidth(context) * 0.05,
                              ),
                              child: SizedBox(
                                width: displayWidth(context) * 0.23,
                                height: displayHeight(context) * 0.07,
                                child: TextFormField(
                                  controller: complementoTextController,
                                  onChanged: (value) {
                                    Modular.get<EnderecoController>()
                                        .defineComplemento(value, tipo);
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
                                    labelText: 'Complemento',
                                    hintText: 'ex: Casa 2',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: displayWidth(context) * 0.4,
                              height: displayHeight(context) * 0.07,
                              child: TextFormField(
                                controller: bairroTextController,
                                onChanged: (value) {
                                  Modular.get<EnderecoController>()
                                      .defineBairro(value, tipo);
                                },
                                onTap: () {
                                  Modular.get<EnderecoController>()
                                      .liberaReadOnly();
                                },
                                readOnly:
                                    Modular.get<EnderecoController>().readOnly,
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
                                child: dropdownCidade,
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
          );
        },
      ),
    );
  }
}
