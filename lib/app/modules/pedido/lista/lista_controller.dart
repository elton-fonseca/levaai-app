import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/services/local_storage.dart';
import '../../../core/stores/pedido_lista_store.dart';
import 'widgets/grid_item.dart';

part 'lista_controller.g.dart';

@Injectable()
class ListaController = _ListaControllerBase with _$ListaController;

abstract class _ListaControllerBase with Store {
  Widget pedidosGrid(BuildContext context) {
    var quantidade = Modular.get<PedidoListaStore>().pedidos.length;

    if (quantidade == 0) {
      return Text('Nenhum Pedido');
    }

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: List.generate(Modular.get<PedidoListaStore>().pedidos.length,
          (indice) {
        return GridItem().obter(
          context: context,
          pedido: Modular.get<PedidoListaStore>().pedidos[indice],
          indice: indice,
        );
      }),
    );
  }

  @action
  void removePedidoLista(int indice) {
    var pedidoStore = Modular.get<PedidoListaStore>();

    pedidoStore.valorTotalPedidos -= pedidoStore.pedidos[indice].valorCotacao;
    pedidoStore.pedidos.removeAt(indice);
  }

  void criarPedido() {
    //cria

    _redireciona();
  }

  void _redireciona() {
    LocalStorage.getValue<String>("token").then((token) {
      if (token.toString().isNotEmpty) {
        Modular.to.pushNamed('/pagamento');
      } else {
        Modular.to.pushNamed('/usuario/cadastro');
      }
    });
  }
}

