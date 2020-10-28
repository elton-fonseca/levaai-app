import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/repositories/monitoramento_repository.dart';
import '../../core/stores/pedido_lista_store.dart';
import '../../core/tema/cores_const.dart';
import '../../core/view/botao_azul.dart';
import '../../core/view/conteudo_padrao.dart';
import '../../core/view/helpers.dart';
import '../../core/view/menu_lateral.dart';
import '../../core/view/navbar_padrao.dart';
import '../../core/view/tamanhos_relativos.dart';
import 'pagamento_controller.dart';
import 'widgets/cartao/dados_cartao.dart';
import 'widgets/pagamento_dropdown.dart';

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
  final enrederecoFaturamentoTextController = TextEditingController();

  void initState() {
    controller.defineCamposValores(
      numeroCartaoTextController: numeroCartaoTextController,
      validadeTextController: validadeTextController,
      codigoSegurancaTextController: codigoSegurancaTextController,
    );

    Modular.get<MonitoramentoRepository>().registrarAcao('pagamento');

    if (widget.acao == 'criar') {
      controller.criarPedidos();
    }

    super.initState();
  }

  Future<bool> _onWillPop() async {
    var mensagem = 'Tem Certeza que deseja sair sem realizar o pagamento?';
    mensagem += 'Depois precisará pagar individualmente os pedidos';

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
                onPressed: () => Navigator.of(context).pop(true),
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
          drawer: MenuLateral(),
          backgroundColor: Colors.transparent,
          body: Builder(
            builder: (contextScaffold) => ConteudoPadrao(
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
                    // ignore: lines_longer_than_80_chars
                    'R\$ ${Helpers.numeroBr(Modular.get<PedidoListaStore>().valorTotalPedidos)}',
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
                                      enderecoFaturamentoTextController:
                                          enrederecoFaturamentoTextController,
                                    )
                                  : Container();
                            },
                          ),
                          SizedBox(height: displayWidth(context) * 0.08),
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
