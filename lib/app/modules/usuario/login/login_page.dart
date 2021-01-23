import 'package:Levaai/app/core/view/navbar_padrao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/view/tamanhos_relativos.dart';
import 'login_controller.dart';
import 'validacao/regras.dart';
import 'widgets/inputs.dart';
import 'widgets/logo.dart';
import 'widgets/rodape.dart';

class LoginPage extends StatefulWidget {
  final String title;

  final String destino;

  const LoginPage({@required this.destino, Key key, this.title = "Login"})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
      child: Scaffold(
        appBar: NavbarPadrao().build(context),
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (contextScaffold) => SingleChildScrollView(
            child: Container(
              height: displayHeight(context) * 0.9,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
              child: Column(
                children: <Widget>[
                  Logo(),
                  SizedBox(height: displayHeight(context) * 0.04),
                  Container(
                    width: displayWidth(context) * 0.8,
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: formKey,
                          child: Column(children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    child: Observer(
                                      builder: (context) => Input().texto(
                                        context: context,
                                        placeholder: 'Email',
                                        validador: validarEmail,
                                        onChange: controller.defineEmail,
                                      ),
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
                                      child: Observer(
                                    builder: (context) => TextFormField(
                                      validator: validarSenha,
                                      onChanged: controller.defineSenha,
                                      obscureText: !_showPassword,
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: _showPassword
                                                ? Colors.blue
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() =>
                                                _showPassword = !_showPassword);
                                          },
                                        ),
                                        errorStyle: TextStyle(
                                          fontSize: 10.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFFC4C4C4),
                                              width: 1.0),
                                        ),
                                        border: const OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                        contentPadding: EdgeInsets.only(
                                          left: 20,
                                        ),
                                        hintText: 'Senha',
                                        hintStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFFC4C4C4),
                                          fontSize:
                                              displayWidth(context) * 0.032,
                                        ),
                                      ),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(height: displayHeight(context) * 0.05),
                            Input().botao(
                                context: context,
                                label: 'Entrar',
                                onClick: () {
                                  controller.login(
                                    formKey,
                                    contextScaffold,
                                    widget.destino,
                                  );
                                }),
                          ]),
                        ),
                        Rodape(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          "2020 LevaAi - Todos os direitos reservados",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: displayWidth(context) * 0.025,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
