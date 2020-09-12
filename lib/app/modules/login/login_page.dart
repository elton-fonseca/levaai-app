import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../core/view/tamanhos_relativos.dart';
import 'login_controller.dart';
import 'validacao/regras.dart';
import 'widgets/inputs.dart';
import 'widgets/logo.dart';
import 'widgets/rodape.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  final formKey = GlobalKey<FormState>();

  final maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: displayHeight(context) * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
            child: Column(
              children: <Widget>[
                Logo(),
                SizedBox(height: displayHeight(context) * 0.05),
                Container(
                  width: displayWidth(context) * 0.7,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: displayHeight(context) * 0.02),
                      Form(
                        key: formKey,
                        child: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  height: displayHeight(context) * 0.07,
                                  child: Input().texto(
                                    context: context,
                                    placeholder: 'Email',
                                    validador: validarEmail,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: displayHeight(context) * 0.05),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  height: displayHeight(context) * 0.07,
                                  child: Input().texto(
                                    context: context,
                                    placeholder: 'Senha',
                                    validador: validarSenha,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: displayHeight(context) * 0.12),
                          Input().botao(
                              context: context,
                              label: 'Entrar',
                              onClick: () {
                                controller.login(formKey);
                              }),
                        ]),
                      ),
                      Rodape()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
