import 'package:flutter/material.dart';
import '../../../../../core/view/botao_selecionar_cor.dart';
import '../../../../../core/view/helpers.dart';
import '../../../../../core/view/tamanhos_relativos.dart';

class ListaRastreamento extends StatelessWidget {
  ListaRastreamento({this.itens});

  final List itens;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.3,
      constraints: BoxConstraints(
        minHeight: displayHeight(context) * 0.3,
      ),
      child: ListView.builder(
          itemCount: itens.length,
          itemBuilder: (context, index) {
            var item = itens[index];
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: displayWidth(context) * 0.039,
                          bottom: displayHeight(context) * 0.047),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            child: Icon(Icons.fiber_manual_record,
                                size: displayWidth(context) * 0.05,
                                color:
                                    item['cor_bolinha'] ?? Color(0xFF95c330)),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: displayWidth(context) * 0.7,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: displayHeight(context) * 0.01,
                                    left: displayWidth(context) * 0.05),
                                child: Text(
                                  item['mensagem'],
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[500],
                                    fontSize: displayWidth(context) * 0.035,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.005,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                Helpers.dataBr(DateTime.parse(item['data'])),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.035,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * 0.005,
                                  left: displayWidth(context) * 0.05),
                              child: Text(
                                Helpers.hora(DateTime.parse(item['data'])),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.grey[500],
                                  fontSize: displayWidth(context) * 0.035,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: displayHeight(context) * 0.009,
                  ),
                  child: Builder(
                    builder: (context) {
                      if (item['botao'] == true) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                BotaoSelecionarCor(
                                  largura: 0.85,
                                  texto: item['botao_mensagem'],
                                  onClick: item['botao_acao'],
                                  cor: item['cor_bolinha'],
                                )
                              ],
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                Divider(
                  color: Colors.white,
                  height: 10,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                ),
              ],
            );
          }),
    );
  }
}
