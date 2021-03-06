import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/stores/pedido_lista_store.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_azul.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'formulario_controller.dart';
import 'formulario_input.dart';
import 'widgets/detalhes/detalhes.dart';
import 'widgets/endereco/endereco.dart';
import 'widgets/endereco/endereco_controller.dart';
import 'widgets/popup/popup_show.dart';
import 'widgets/tipo_medida/tipo_medida_controller.dart';

class FormularioPage extends StatefulWidget {
  final String title;

  final int id;

  final String acao;

  const FormularioPage(
      {Key key, this.title = "Pedido", @required this.id, @required this.acao})
      : super(key: key);

  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState
    extends ModularState<FormularioPage, FormularioController>
    with FormularioInputs {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (widget.acao == 'criar') {
          Modular.get<PedidoListaStore>().pedidos.removeAt(widget.id);
        }

        return true;
      },
      child: Scaffold(
        body: Builder(
          builder: (contextScaffold) => Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
            child: Scaffold(
              appBar: NavbarPadrao().build(context),
              backgroundColor: Colors.transparent,
              body: ConteudoPadrao(
                textoCabecalho: Text(
                  'Configure o seu pedido',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                conteudo: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: displayHeight(context) * 0.05,
                    ),
                    child: Text(
                      "Local de Coleta",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: displayWidth(context) * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Endereco().obter(
                    context: contextScaffold,
                    tipo: 'origem',
                    cepTextController: cepOrigemTextController,
                    cepAcao: (cep) {
                      Modular.get<EnderecoController>().autocompleteEndereco(
                          context: contextScaffold,
                          cep: cep,
                          logradouroTextController:
                              logradouroOrigemTextController,
                          numeroTextController: numeroOrigemTextController,
                          bairroTextController: bairroOrigemTextController,
                          tipo: 'origem',
                          atualizaCidadeDropdown: (novaCidade) {
                            setState(() {
                              ibgeOrigem = novaCidade;
                            });
                          });
                    },
                    logradouroTextController: logradouroOrigemTextController,
                    numeroTextController: numeroOrigemTextController,
                    complementoTextController: complementoOrigemTextController,
                    bairroTextController: bairroOrigemTextController,
                    dropdownCidade: FutureBuilder(
                      future: cidadesAtendidas,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List itens = snapshot.data;
                          return Container(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: itens.map((cidade) {
                                  return DropdownMenuItem<String>(
                                    value: cidade['CODMUN_CID'],
                                    child: Text(
                                      "${cidade['NOME_CID']} - ${cidade['ESTADO_CID']}",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => ibgeOrigem = value);

                                  var cidade = itens.firstWhere((element) =>
                                      element['CODMUN_CID'] == value);

                                  Modular.get<EnderecoController>()
                                      .defineCidadeNome(
                                          cidade['NOME_CID'], 'origem');

                                  Modular.get<EnderecoController>()
                                      .defineCidadeIbge(value, 'origem');
                                },
                                value: ibgeOrigem,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("erro ao obter cidades");
                        }
                        return CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        );
                      },
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
                      top: displayHeight(context) * 0.025,
                    ),
                    child: Text(
                      "Local de Entrega",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: displayWidth(context) * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Endereco().obter(
                    context: contextScaffold,
                    tipo: 'destino',
                    cepTextController: cepDestinoTextController,
                    cepAcao: (cep) {
                      Modular.get<EnderecoController>().autocompleteEndereco(
                          context: contextScaffold,
                          cep: cep,
                          logradouroTextController:
                              logradouroDestinoTextController,
                          numeroTextController: numeroDestinoTextController,
                          bairroTextController: bairroDestinoTextController,
                          tipo: 'destino',
                          atualizaCidadeDropdown: (novaCidade) {
                            setState(() {
                              ibgeDestino = novaCidade;
                            });
                          });
                    },
                    logradouroTextController: logradouroDestinoTextController,
                    numeroTextController: numeroDestinoTextController,
                    complementoTextController: complementoDestinoTextController,
                    bairroTextController: bairroDestinoTextController,
                    dropdownCidade: FutureBuilder(
                      future: cidadesAtendidas,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List itens = snapshot.data;
                          return Container(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: itens.map((cidade) {
                                  return DropdownMenuItem<String>(
                                    value: cidade['CODMUN_CID'],
                                    child: Text(
                                      "${cidade['NOME_CID']} - ${cidade['ESTADO_CID']}",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() => ibgeDestino = value);

                                  var cidade = itens.firstWhere((element) =>
                                      element['CODMUN_CID'] == value);

                                  Modular.get<EnderecoController>()
                                      .defineCidadeNome(
                                          cidade['NOME_CID'], 'destino');

                                  Modular.get<EnderecoController>()
                                      .defineCidadeIbge(value, 'destino');
                                },
                                value: ibgeDestino,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("erro ao obter cidades");
                        }
                        return CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: displayHeight(context) * 0.04),
                  Observer(builder: (_) {
                    return Text(
                      Modular.get<TipoMedidaController>().descritivoLabel(),
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: displayWidth(context) * 0.04,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
                  SizedBox(height: displayHeight(context) * 0.04),
                  Observer(builder: (_) {
                    return Modular.get<TipoMedidaController>()
                        .pegarTipoDeMedida();
                  }),
                  SizedBox(height: displayHeight(context) * 0.08),
                  Observer(
                    builder: (context) {
                      return BotaoBranco(
                        onClick: () {
                          PopupShow().showPopup(context, 'Medidas');
                        },
                        texto: Modular.get<TipoMedidaController>()
                            .descritivoTipoDeMedida(),
                      );
                    },
                  ),
                  SizedBox(height: displayHeight(context) * 0.08),
                  Container(
                    height: displayHeight(context) * 0.25,
                    width: displayWidth(context) * 0.95,
                    decoration: BoxDecoration(
                      color: Color(0xfff7f9f8),
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                          color: CoresConst.azulPadrao.withOpacity(0.1),
                          spreadRadius: 10,
                          blurRadius: 15,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Detalhes().obter(
                        context: context,
                        valorTotalTextController: valorTotalTextController,
                        pesoTextController: pesoTextController,
                        tipoMercadoriaTextController:
                            tipoMercadoriaTextController),
                  ),
                  SizedBox(height: displayHeight(context) * 0.08),
                  BotaoAzul(
                    onClick: () {
                      controller.enviar(contextScaffold, widget.acao);
                    },
                    texto: "Verificar Valor",
                  ),
                  SizedBox(height: displayHeight(context) * 0.08),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
