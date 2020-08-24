import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'home_controller.dart';

//import 'package:flutter_mobx/flutter_mobx.dart';

class NovaContaPage extends StatefulWidget {
  final String title;
  const NovaContaPage({Key key, this.title = "Nova Conta"}) : super(key: key);

  @override
  _NovaContaPageState createState() => _NovaContaPageState();
}

class _NovaContaPageState extends ModularState<NovaContaPage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavbarPadrao().build(context),
      backgroundColor: CoresConst.azulPadrao,
      body: ConteudoPadrao(
        textoCabecalho: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Crie sua conta',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                                    color: Colors.grey[400],
                                    fontSize: 14,
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
                        width: displayWidth(context) * 0.8,
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
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            onPressed: () {
                              Modular.to.pushNamed('');
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
