import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../repositories/usuario_repository.dart';
import 'altera_controller.dart';
import 'widgets/informacoes_basicas.dart';

class AlterarPage extends StatefulWidget {
  final String title;
  const AlterarPage({Key key, this.title = "Usuario"}) : super(key: key);

  @override
  _AlterarPageState createState() => _AlterarPageState();
}

class _AlterarPageState extends ModularState<AlterarPage, AlteraController> {
  final documentoTextController = MaskedTextController(mask: '000.000.000-00');
  final telefoneTextController = MaskedTextController(mask: '(00) 00000-0000');
  final nomeTextController = TextEditingController();
  final sobrenomeTextController = TextEditingController();
  final emailTextController = TextEditingController();

  Future<dynamic> dadosUsuarioBanco;

  void initState() {
    Modular.get<UsuarioRepository>().obterUsuarioLogado().then((dados) {
      controller.populaDadosIniciais(
        dados,
        telefoneTextController,
        documentoTextController,
        nomeTextController,
        sobrenomeTextController,
        emailTextController,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
      child: Scaffold(
        appBar: NavbarPadrao().build(context),
        //drawer: MenuLateral(),
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (contextScaffold) => ConteudoPadrao(
            textoCabecalho: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      right: displayWidth(context) * 0.09,
                      top: displayWidth(context) * 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Alteração Cadastral',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: displayWidth(context) * 0.06,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        right: displayWidth(context) * 0.09,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Deseja Alterar a Senha? ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: displayWidth(context) * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/login/trocar/senha/token');
                            },
                            child: Text(
                              'Clique aqui',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontSize: displayWidth(context) * 0.03,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            conteudo: SizedBox(
              width: displayWidth(context) * 0.7,
              child: Column(
                children: <Widget>[
                  SizedBox(height: displayHeight(context) * 0.04),
                  InformacoesBasicas(
                    documentoTextController: documentoTextController,
                    telefoneTextController: telefoneTextController,
                    nomeTextController: nomeTextController,
                    sobrenomeTextController: sobrenomeTextController,
                    emailTextController: emailTextController,
                  ),
                  SizedBox(height: displayHeight(context) * 0.04),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: displayWidth(context) * 0.7,
                            height: displayHeight(context) * 0.07,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: CoresConst.azulPadrao,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              border: Border.all(
                                width: 3,
                                color: CoresConst.azulPadrao,
                              ),
                            ),
                            child: SizedBox.expand(
                              child: FlatButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Alterar dados",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: displayWidth(context) * 0.04,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  controller.enviar(contextScaffold);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: displayHeight(context) * 0.08),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
