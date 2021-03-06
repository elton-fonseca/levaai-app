import 'package:mobx/mobx.dart';

import '../models/pedido.dart';

part 'pedido_lista_store.g.dart';

class PedidoListaStore = _PedidoListaStoreBase with _$PedidoListaStore;

abstract class _PedidoListaStoreBase with Store {
  @observable
  ObservableList pedidos = [].asObservable();

  @observable
  double valorTotalPedidos = 0;

  double valorDescontoPedidos = 0;

  String cupomDescontoPedidos = '';

  Map<String, dynamic> pedidosCompletosJson() {
    final data = <String, dynamic>{};

    data['pedidos'] = pedidos.map((v) => v.pedidoCompletoJson()).toList();

    return data;
  }

  void populaIdsPedidos(List relacao) {
    for (var item in relacao) {
      var p = pedidos
          .firstWhere((element) => element.idLocal == item['id_temporario']);

      p.idPedido = item['id_banco'];
      //pedidos.elementAt(item['id_temporario']).idPedido = item['id_banco'];
    }
  }

  List pedidosIds() {
    return pedidos.map((v) => v.idPedido).toList();
  }

  @action
  void addPedido() {
    var pedidonew = Pedido();
    pedidos.add(pedidonew);
  }

  void limpar() {
    pedidos = [].asObservable();
  }
}
