import 'package:Levaai/app/core/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/tema/cores_const.dart';
import '../../../core/view/botao_azul.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/helpers.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'cotacao_controller.dart';
import 'cotacao_page_init.dart';
import 'widget/input_text.dart';
import 'widget/prazos.dart';

class CotacaoPage extends StatefulWidget {
  final String title;

  final int id;

  final String acao;

  const CotacaoPage(
      {Key key, this.title = "Pedido", @required this.id, @required this.acao})
      : super(key: key);

  @override
  _CotacaoPageState createState() => _CotacaoPageState();
}

class _CotacaoPageState extends ModularState<CotacaoPage, CotacaoController>
    with CotacaoPageInit {
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
          builder: (contextScaffold) => ConteudoPadrao(
            textoCabecalho: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Valor do Transporte',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.04,
                  ),
                ),
                FutureBuilder(
                  future: valorCotacao,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        'R\$ ${Helpers.numeroBr(snapshot.data.valor)}',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: displayWidth(context) * 0.09,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("erro ao calcular");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    );
                  },
                ),
                FutureBuilder(
                  future: LocalStorage.getValue<String>("token"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.toString().isEmpty) {
                        return Text(
                          'Ganhe R\$5,00 de desconto na primeira contratação',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: displayWidth(context) * 0.03,
                          ),
                        );
                      }

                      return Container();
                    } else if (snapshot.hasError) {
                      return Text("erro ao calcular");
                    }

                    // By default, show a loading spinner.
                    return CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    );
                  },
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
                      borderRadius:
                          BorderRadius.all(const Radius.circular(15.0)),
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
                        FutureBuilder(
                          future: valorCotacao,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Prazos(
                                imagem: "assets/imagens/box-fechada.png",
                                tipo: 'COLETA',
                                prazo: snapshot.data.prazoColeta,
                              );
                            } else if (snapshot.hasError) {
                              return Text("erro ao calcular");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            );
                          },
                        ),
                        SizedBox(
                          height: displayHeight(context) * 0.03,
                        ),
                        FutureBuilder(
                          future: valorCotacao,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Prazos(
                                imagem: "assets/imagens/box-aberta.png",
                                tipo: 'ENTREGA',
                                prazo: snapshot.data.prazoEntrega,
                              );
                            } else if (snapshot.hasError) {
                              return Text("erro ao calcular");
                            }

                            // By default, show a loading spinner.
                            return CircularProgressIndicator(
                              backgroundColor: Colors.white,
                            );
                          },
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
                                    child: InputText(
                                      placeholder: 'Nome Completo',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelColeta(valor);
                                      },
                                      textController:
                                          responsavelColetaTextController,
                                      tamanho: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: InputText(
                                      placeholder: '(99) 99999-9999',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelColetaCelular(
                                                valor);
                                      },
                                      tipo: 'tel',
                                      textController:
                                          // ignore: lines_longer_than_80_chars
                                          responsavelColetaCelularTextController,
                                      tamanho: 15,
                                      alinhamento: 'direita',
                                    ),
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
                                right: displayWidth(context) * 0.115,
                                left: displayWidth(context) * 0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'CPF/CNPJ Responsável',
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
                                    child: InputText(
                                      placeholder: 'Documento',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelColetaDocumento(
                                          valor,
                                          responsavelColetaDocumentoController,
                                        );
                                      },
                                      textController:
                                          responsavelColetaDocumentoController,
                                      tamanho: 18,
                                      tipo: 'numero',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
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
                                  'Responsável pela entrega',
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
                                    child: InputText(
                                      placeholder: 'Nome Completo',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelEntrega(valor);
                                      },
                                      textController:
                                          responsavelEntregaTextController,
                                      tamanho: 22,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: InputText(
                                      placeholder: '(99) 99999-9999',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelEntregaCelular(
                                                valor);
                                      },
                                      tipo: 'tel',
                                      textController:
                                          // ignore: lines_longer_than_80_chars
                                          responsavelEntregaCelularTextController,
                                      tamanho: 15,
                                      alinhamento: 'direita',
                                    ),
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
                                right: displayWidth(context) * 0.115,
                                left: displayWidth(context) * 0.025),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'CPF/CNPJ Responsável',
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
                                    child: InputText(
                                      placeholder: 'Documento',
                                      onChange: (valor) {
                                        controller
                                            .defineResponsavelEntregaDocumento(
                                          valor,
                                          responsavelEntregaDocumentoController,
                                        );
                                      },
                                      textController:
                                          responsavelEntregaDocumentoController,
                                      tamanho: 18,
                                      tipo: 'numero',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          height: displayWidth(context) * 0.10,
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
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
                              onChanged: controller.defineObservacao,
                              controller: observacaoTextController,
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
                          Modular.to.pop(context);
                        },
                      ),
                      BotaoAzul(
                        texto: "Confirmar",
                        largura: 0.4,
                        onClick: () {
                          controller.enviar(contextScaffold, widget.acao);
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
      ),
    );
  }
}
