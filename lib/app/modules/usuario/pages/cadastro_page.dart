import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';

import '../controllers/usuario_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Usuario"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends ModularState<CadastroPage, UsuarioController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarPadrao().build(context),
      drawer: MenuLateral(),
      backgroundColor: CoresConst.azulPadrao,
      body: ConteudoPadrao(
        textoCabecalho: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        conteudo: SizedBox(
          width: displayWidth(context) * 0.7,
          child: Column(
            children: <Widget>[
              SizedBox(height: displayHeight(context) * 0.04),
              Container(
                width: displayWidth(context) * 0.90,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: displayHeight(context) * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Nome',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: displayWidth(context) * 0.05),
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Sobrenome',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Celular',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Número do CPF',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: displayWidth(context) * 0.08),
                  ],
                ),
              ),
              SizedBox(height: displayHeight(context) * 0.04),
              Container(
                width: displayWidth(context) * 0.90,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                child: Column(
                  children: <Widget>[
                    SizedBox(height: displayHeight(context) * 0.02),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Senha',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.03,
                        left: displayWidth(context) * 0.05,
                        right: displayWidth(context) * 0.05,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              child: TextFormField(
                                obscureText: true,
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: displayWidth(context) * 0.04,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.remove_red_eye),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    borderSide: BorderSide(
                                      color: Colors.grey[700],
                                      width: 4,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Repetir Senha',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.grey[400],
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: displayWidth(context) * 0.08),
                  ],
                ),
              ),
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
    );
  }
}
