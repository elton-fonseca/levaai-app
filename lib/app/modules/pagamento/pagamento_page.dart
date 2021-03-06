import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/repositories/monitoramento_repository.dart';
import '../../core/stores/pedido_lista_store.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/botao_azul.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'pagamento_controller.dart';
import 'repositories/cupom_repository.dart';
import 'widgets/cartao/dados_cartao.dart';
import 'widgets/pagamento_dropdown.dart';
import 'widgets/preco.dart';
import 'widgets/termos_condicoes.dart';

class PagamentoPage extends StatefulWidget {
  final String acao;

  final String title;
  const PagamentoPage({@required this.acao, Key key, this.title = "Pagamento"})
      : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState
    extends ModularState<PagamentoPage, PagamentoController> {
  final numeroCartaoTextController =
      MaskedTextController(mask: '0000 0000 0000 0000');
  final validadeTextController = MaskedTextController(mask: '00/00');
  final codigoSegurancaTextController = MaskedTextController(mask: '0000');
  final enrederecoFaturamentoCepTextController =
      MaskedTextController(mask: '00000-000');
  final enrederecoFaturamentoLogradouroTextController = TextEditingController();
  final enrederecoFaturamentoNumeroTextController = TextEditingController();
  final enrederecoFaturamentoBairroTextController = TextEditingController();
  final enrederecoFaturamentoCidadeTextController = TextEditingController();
  final enrederecoFaturamentoEstadoTextController =
      MaskedTextController(mask: 'AA');

  Future desconto;

  void initState() {
    controller.defineCamposValores(
      numeroCartaoTextController: numeroCartaoTextController,
      validadeTextController: validadeTextController,
      codigoSegurancaTextController: codigoSegurancaTextController,
    );

    Modular.get<MonitoramentoRepository>().registrarAcao('pagamento');

    desconto = Modular.get<CupomRepository>().validarCodigo('primeiro-pedido');

    desconto.then((value) {
      if (widget.acao == 'criar') {
        controller.criarPedidos();
      }

      Modular.get<PedidoListaStore>().valorDescontoPedidos = value['valor'];

      if (value['valor'] > 0.001) {
        Modular.get<PedidoListaStore>().cupomDescontoPedidos =
            'primeiro-pedido';
      }
    });

    super.initState();
  }

  Future<bool> _onWillPop() async {
    var mensagem = 'Tem Certeza que deseja sair sem realizar o pagamento?';

    if (widget.acao == 'criar') {
      mensagem += ' Depois precisará pagar individualmente os pedidos';
    }

    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Atenção!'),
            content: Text(mensagem),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Não Sair'),
              ),
              FlatButton(
                onPressed: () {
                  if (widget.acao != 'criar') {
                    Navigator.of(context).pop(true);
                  } else {
                    Navigator.of(context).pop(true);
                    Modular.to.popUntil(ModalRoute.withName('/'));
                    Modular.to.pushNamed('/rastreamento/lista');
                  }
                },
                child: Text('Sim'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF2E4983), Color(0xFF005BC3)])),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: NavbarPadrao().build(context),
          // drawer: MenuLateral(),
          backgroundColor: Colors.transparent,
          body: Builder(
            builder: (contextScaffold) => ConteudoPadrao(
              textoCabecalho: FutureBuilder(
                future: desconto,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Preco(
                      valor: Modular.get<PedidoListaStore>().valorTotalPedidos,
                      desconto: snapshot.data['valor'],
                      texto: snapshot.data['mensagem'],
                    );
                  } else if (snapshot.hasError) {
                    return Text("erro ao obter usuário");
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  );
                },
              ),
              conteudo: SizedBox(
                width: displayWidth(context) * 0.7,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: displayHeight(context) * 0.03,
                          top: displayHeight(context) * 0.04),
                      child: SizedBox(
                        height: displayHeight(context) * 0.06,
                        width: displayWidth(context) * 0.8,
                        child: Text(
                          'Preencha abaixo os \ndados para pagamento:',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: displayWidth(context) * 0.04,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                          SizedBox(height: displayHeight(context) * 0.02),
                          Padding(
                            padding: EdgeInsets.only(
                              top: displayHeight(context) * 0.03,
                              left: displayWidth(context) * 0.025,
                              right: displayWidth(context) * 0.025,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    child: Observer(
                                      builder: (_) {
                                        return DropdownPagamento();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Observer(
                            builder: (_) {
                              return controller.pagamento.tipoPagamento ==
                                      'cartao'
                                  ? DadosCartao(
                                      numeroCartaoTextController:
                                          numeroCartaoTextController,
                                      validadeTextController:
                                          validadeTextController,
                                      codigoSegurancaTextController:
                                          codigoSegurancaTextController,
                                      enderecoFaturamentoCepTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoCepTextController,
                                      // ignore: lines_longer_than_80_chars
                                      enderecoFaturamentoLogradouroTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoLogradouroTextController,
                                      enderecoFaturamentoNumeroTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoNumeroTextController,
                                      enderecoFaturamentoBairroTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoBairroTextController,
                                      enderecoFaturamentoCidadeTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoCidadeTextController,
                                      enderecoFaturamentoEstadoTextController:
                                          // ignore: lines_longer_than_80_chars
                                          enrederecoFaturamentoEstadoTextController,
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(height: displayWidth(context) * 0.08),
                          TermosCondicoes()
                        ],
                      ),
                    ),
                    SizedBox(height: displayHeight(context) * 0.04),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Observer(builder: (_) {
                              return BotaoAzul(
                                onClick: controller.botaoPagar == false
                                    ? null
                                    : () {
                                        controller.pagar(contextScaffold);
                                      },
                                texto: controller.pagamento.tipoPagamento ==
                                        'cartao'
                                    ? 'Realizar Pagamento'
                                    : 'Gerar Boleto',
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: displayHeight(context) * 0.03),
                      ],
                    ),
                    SizedBox(height: displayHeight(context) * 0.08),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
