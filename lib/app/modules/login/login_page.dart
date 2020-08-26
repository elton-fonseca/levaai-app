import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Color(0xFF144886),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.1),
                child: Text(
                  'Acesse sua conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.05),
                child: Center(
                  child: SizedBox(
                    child: Image.asset("assets/logo.png"),
                  ),
                ),
              ),
              Text(
                'LEVAAI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'DAQUI PRA LÁ RAPIDINHO',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: displayHeight(context) * 0.05),
              Container(
                width: displayWidth(context) * 0.7,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: displayHeight(context) * 0.06,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFC4C4C4), width: 1.0),
                                ),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                  fontSize: 14,
                                ),
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
                            height: displayHeight(context) * 0.06,
                            child: TextFormField(
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFFC4C4C4), width: 1.0),
                                ),
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 1.5),
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: 'Senha',
                                hintStyle: TextStyle(
                                  color: Color(0xFFC4C4C4),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: displayWidth(context) * 0.05,
                          child: Checkbox(
                            value: false,
                            tristate: false,
                            onChanged: (bool isChecked) {},
                          ),
                        ),
                        SizedBox(width: displayWidth(context) * 0.02),
                        Text(
                          'Mantenha-me conectado',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: displayHeight(context) * 0.05),
                    Container(
                      width: displayWidth(context) * 0.8,
                      height: displayHeight(context) * 0.07,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: CoresConst.verdepadrao,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          border: Border.all(
                            width: 3,
                            color: CoresConst.verdepadrao,
                          )),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "ACESSAR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onPressed: () {
                            Modular.to.pushNamed('/pedido/listar');
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Esqueceu a senha? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Clique Aqui.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: displayHeight(context) * 0.06),
                    Text(
                      "2020 LevaAi - Todos os direitos reservados",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
