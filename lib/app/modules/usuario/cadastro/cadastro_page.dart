import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'cadastro_controller.dart';
import 'widgets/informacoes_acesso.dart';
import 'widgets/informacoes_basicas.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Usuario"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  final documentoTextController = MaskedTextController(mask: '000.000.000-00');
  final telefoneTextController = MaskedTextController(mask: '(00) 0000-00000');

  void initState() {
    controller.defineCamposValores(
      documentoTextController: documentoTextController,
      telefoneTextController: telefoneTextController,
    );

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
        drawer: MenuLateral(),
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
                        'Não possui uma conta?',
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
                            'Entre com seus dados! ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: displayWidth(context) * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: displayWidth(context) * 0.09,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Já possui conta? ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: displayWidth(context) * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/login/formulario/pagamento');
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
                  ),
                  SizedBox(height: displayHeight(context) * 0.04),
                  InformacoesAcesso(),
                  SizedBox(height: displayHeight(context) * 0.08),
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
                                      "Criar conta",
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
