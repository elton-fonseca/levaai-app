import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../main.dart';
import '../../../core/view/botao_azul.dart';
import '../../../core/view/conteudo_padrao.dart';
import '../../../core/view/menu_lateral.dart';
import '../../../core/view/navbar_padrao.dart';
import '../../../core/view/tamanhos_relativos.dart';
import 'lista_controller.dart';
import 'widgets/grid_item.dart';

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
    print(pedidoListaStore.pedidos);

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
        drawer: MenuLateral(),
        backgroundColor: Colors.transparent,
        body: ConteudoPadrao(
          textoCabecalho: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BotaoAzul(
                  texto: 'Adicionar Pedido',
                  onClick: () {
                    var indice = pedidoListaStore.pedidos.length;
                    Modular.to.pushNamed('/pedido/formulario/$indice/criar');
                  }),
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
            child: Observer(
              builder: (_) => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children:
                    List.generate(pedidoListaStore.pedidos.length, (indice) {
                  return GridItem().obter(
                    context: context,
                    pedido: pedidoListaStore.pedidos[indice],
                    indice: indice,
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
