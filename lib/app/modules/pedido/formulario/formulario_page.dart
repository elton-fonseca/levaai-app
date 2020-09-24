import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/stores/pedido_lista_store.dart';

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
    return Scaffold(
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
                Endereco().obter(
                  context: contextScaffold,
                  origemTextController: enderecoOrigemTextController,
                  destinoTextController: enderecoDestinoTextController,
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
                  child: Detalhes().obter(
                    context: context,
                    valorTotalTextController: valorTotalTextController,
                  ),
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
    );
  }
}
