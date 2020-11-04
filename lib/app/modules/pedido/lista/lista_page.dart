import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/repositories/monitoramento_repository.dart';

import '../../../core/stores/pedido_lista_store.dart';
import '../../../core/view/botao_azul.dart';
import '../../../core/view/botao_branco.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/helpers.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'lista_controller.dart';

class ListaPage extends StatefulWidget {
  final String title;
  const ListaPage({Key key, this.title = "Pedido"}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends ModularState<ListaPage, ListaController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    Modular.get<MonitoramentoRepository>().registrarAcao('lista/pedidos');

    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Atenção!'),
            content: Text('Tem Certeza que deseja Cancelar o pedido?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Não Cancelar'),
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
          //drawer: MenuLateral(),
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
                Observer(
                  builder: (context) {
                    return Text(
                      // ignore: lines_longer_than_80_chars
                      'R\$ ${Helpers.numeroBr(Modular.get<PedidoListaStore>().valorTotalPedidos)}',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: displayWidth(context) * 0.09,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                )
              ],
            ),
            conteudo: Column(
              children: <Widget>[
                SizedBox(height: displayHeight(context) * 0.03),
                Container(
                  height: displayHeight(context) * 0.55,
                  child: Observer(
                    // ignore: unnecessary_lambdas
                    builder: (context) {
                      return controller.pedidosGrid(context);
                    },
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoAzul(
                        largura: 0.4,
                        texto: '+ Pedido',
                        onClick: () {
                          var indice =
                              Modular.get<PedidoListaStore>().pedidos.length;
                          Modular.to
                              .pushNamed('/pedido/formulario/$indice/criar');
                        }),
                    BotaoBranco(
                        largura: 0.4,
                        texto: 'Pagamento',
                        onClick: () {
                          controller.criarPedido(context);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
