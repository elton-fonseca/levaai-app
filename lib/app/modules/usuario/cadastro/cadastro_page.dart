import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/usuario/cadastro/widgets/informacoes_basicas.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';

import 'cadastro_controller.dart';
import 'widgets/informacoes_acesso.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Usuario"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller

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
        body: ConteudoPadrao(
          textoCabecalho: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.22),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Crie sua conta',
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
            ],
          ),
          conteudo: SizedBox(
            width: displayWidth(context) * 0.7,
            child: Column(
              children: <Widget>[
                SizedBox(height: displayHeight(context) * 0.04),
                InformacoesBasicas(),
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
                                Modular.to.pushNamed('/pagamento');
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
    );
  }
}