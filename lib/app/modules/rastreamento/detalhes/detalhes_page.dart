import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/rastreamento/detalhes/widgets/rastreamento/tratar_itens_rastreamento.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import '../repositories/rastreamento_repository.dart';
import 'detalhes_controller.dart';
import 'widgets/detalhes.dart';
import 'widgets/lista_itens_pedido.dart';
import 'widgets/rastreamento/lista_rastreamento.dart';

class DetalhesPage extends StatefulWidget {
  final int id;

  final String title;
  const DetalhesPage({@required this.id, Key key, this.title = "Detalhes"})
      : super(key: key);

  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState
    extends ModularState<DetalhesPage, DetalhesController> {
  Future<dynamic> _pedido;

  @override
  void initState() {
    _pedido = Modular.get<RastreamentoRepository>().pegarPedido(widget.id);

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
        backgroundColor: Colors.transparent,
        body: ConteudoPadrao(
          textoCabecalho: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.17),
                child: Text(
                  'Detalhes Pedido',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
          conteudo: SizedBox(
            width: displayWidth(context) * 0.7,
            child: Column(
              children: <Widget>[
                SizedBox(height: displayHeight(context) * 0.05),
                FutureBuilder(
                  future: _pedido,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Detalhes(pedido: snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text("erro ao obter dados");
                    }
                    return CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    );
                  },
                ),
                SizedBox(height: displayHeight(context) * 0.05),
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
                      Padding(
                        padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.05,
                          left: displayWidth(context) * 0.05,
                          right: displayWidth(context) * 0.09,
                          bottom: displayHeight(context) * 0.03,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Rastreamento",
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: CoresConst.azulPadrao,
                                fontSize: displayWidth(context) * 0.05,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: displayWidth(context) * 0.0),
                              child: SizedBox(
                                height: displayHeight(context) * 0.02,
                                child:
                                    Image.asset("assets/imagens/box-blue.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: _pedido,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListaRastreamento(
                              itens: TratarItensRastreamento()
                                  .executar(snapshot.data),
                            );
                          } else if (snapshot.hasError) {
                            return Text("erro ao obter dados");
                          }
                          return CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          );
                        },
                      ),
                      SizedBox(
                        height: displayHeight(context) * 0.03,
                      ),
                      Container(
                        width: displayWidth(context) * 0.95,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
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
                            Padding(
                              padding: EdgeInsets.only(
                                top: displayHeight(context) * 0.03,
                                left: displayWidth(context) * 0.05,
                                right: displayWidth(context) * 0.05,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Itens do Pedido:',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: CoresConst.azulPadrao,
                                      fontSize: displayWidth(context) * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder(
                              future: _pedido,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListaItensPedido(
                                      itens: snapshot.data['itens_pedido']);
                                } else if (snapshot.hasError) {
                                  return Text("erro ao obter dados");
                                }
                                return CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
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
                            color: Colors.white,
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
                                    "Adicionar novo pedido",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      color: CoresConst.azulPadrao,
                                      fontSize: displayWidth(context) * 0.04,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Modular.to.pushNamed('/pedido/form');
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
