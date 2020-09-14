import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_azul.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../controllers/pedido_form_controller.dart';

class PedidoCotacaoPage extends StatefulWidget {
  final String title;
  const PedidoCotacaoPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _PedidoCotacaoPageState createState() => _PedidoCotacaoPageState();
}

class _PedidoCotacaoPageState
    extends ModularState<PedidoCotacaoPage, PedidoFormController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
      child: Scaffold(
        appBar: NavbarPadrao().build(context),
        backgroundColor: Colors.transparent,
        body: ConteudoPadrao(
          textoCabecalho: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Total Geral',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.04,
                ),
              ),
              Text(
                'R\$1200,00',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontSize: displayWidth(context) * 0.09,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          conteudo: SizedBox(
            width: displayWidth(context) * 0.7,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: displayHeight(context) * 0.05,
                ),
                Container(
                  width: displayWidth(context) * 0.95,
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
                      SizedBox(
                        height: displayHeight(context) * 0.03,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.025,
                                  right: displayWidth(context) * 0.025,
                                ),
                                child: SizedBox(
                                  width: displayWidth(context) * 0.1,
                                  child: Image.asset("assets/box-fechada.png"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'DATA DE COLETA',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'PREVISTA ENTRE 24/06 e 27/06',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.035,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.03,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: displayWidth(context) * 0.025,
                                  right: displayWidth(context) * 0.025,
                                ),
                                child: SizedBox(
                                  width: displayWidth(context) * 0.1,
                                  child: Image.asset("assets/box-aberta.png"),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'DATA DE ENTREGA',
                                style: TextStyle(
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.035,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'PREVISTA ENTRE 24/06 e 27/06',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.035,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.grey[300],
                        height: displayWidth(context) * 0.10,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      Container(
                        height: displayHeight(context) * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFf4f5f7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.115,
                              left: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Responsável pela coleta',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.032,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Contato',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.032,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.04,
                        decoration: BoxDecoration(
                          color: Color(0xFFf4f5f7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.025,
                              left: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF909090),
                                      fontSize: displayWidth(context) * 0.032,
                                    ),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          bottom: displayWidth(context) * 0.06),
                                      hintText: 'Digite o nome aqui...',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF909090),
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF909090),
                                      fontSize: displayWidth(context) * 0.032,
                                    ),
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          bottom: displayWidth(context) * 0.06),
                                      hintText: '11 909099909',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF909090),
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Checkbox(value: false, onChanged: null),
                              Text(
                                'Mesmo do cadastro',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.032,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.05,
                        decoration: BoxDecoration(
                          color: Color(0xFFf4f5f7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.115,
                              left: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Responsável pela coleta',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.032,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Contato',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xFF909090),
                                  fontSize: displayWidth(context) * 0.032,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: displayHeight(context) * 0.04,
                        decoration: BoxDecoration(
                          color: Color(0xFFf4f5f7),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.025,
                              left: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF909090),
                                      fontSize: displayWidth(context) * 0.032,
                                    ),
                                    textAlign: TextAlign.left,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          bottom: displayWidth(context) * 0.06),
                                      hintText: 'Digite o nome aqui...',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF909090),
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xFF909090),
                                      fontSize: displayWidth(context) * 0.032,
                                    ),
                                    textAlign: TextAlign.right,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          bottom: displayWidth(context) * 0.06),
                                      hintText: '11 909099909',
                                      hintStyle: TextStyle(
                                        color: Color(0xFF909090),
                                        fontSize: displayWidth(context) * 0.032,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: displayWidth(context) * 0.025),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Checkbox(value: false, onChanged: null),
                              Text(
                                'Mesmo do cadastro',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: displayWidth(context) * 0.032,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: displayWidth(context) * 0.09,
                                bottom: displayHeight(context) * 0.005),
                            child: Text(
                              'Observações:',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: displayWidth(context) * 0.032,
                                color: Color(0xFF909090),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: displayHeight(context) * 0.2,
                        width: displayWidth(context) * 0.90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.0),
                            border: Border.all(
                              width: 2,
                              color: Color(0xFFC4C4C4),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.grey[600],
                              fontSize: displayWidth(context) * 0.032,
                            ),
                            minLines: 5,
                            maxLines: 5,
                            maxLength: 230,
                            maxLengthEnforced: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.05,
                      )
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    BotaoBranco(
                      texto: "Editar",
                      largura: 0.4,
                      onClick: () {
                        Modular.to.pushNamed('/pedido/form');
                      },
                    ),
                    BotaoAzul(
                      texto: "Confirmar",
                      largura: 0.4,
                      onClick: () {
                        Modular.to.pushNamed('/pedido/destalhes');
                      },
                    )
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
