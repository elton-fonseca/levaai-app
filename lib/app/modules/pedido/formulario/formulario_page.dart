import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/Stores/pedido_lista_store.dart';
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
import 'widgets/itens/medida_relativa.dart';
import 'widgets/popup/popup_show.dart';

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
  //use 'controller' variable to access controller

  //final _itens = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
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
                context: context,
                origemTextController: enderecoOrigemTextController,
                destinoTextController: enderecoDestinoTextController,
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              Text(
                'Quantidade de Volumes:',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: displayWidth(context) * 0.04,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              MedidaRelativa(),
              SizedBox(height: displayHeight(context) * 0.08),
              BotaoBranco(
                onClick: () {
                  var l = Modular.get<PedidoListaStore>().pedidos;
                  l[0].cepDestino = '';
                  PopupShow().showPopup(context, 'Medidas');
                },
                texto: "Tenho as medidas Exatas",
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
                  Modular.to.pushNamed('/pedido/cotacao');
                },
                texto: "Verificar Valor",
              ),
              SizedBox(height: displayHeight(context) * 0.08),
            ]),
          ),
        ),
      ),
    );
  }
}
