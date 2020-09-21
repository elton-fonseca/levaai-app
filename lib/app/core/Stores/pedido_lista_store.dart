import 'package:mobx/mobx.dart';

import '../models/pedido.dart';

part 'pedido_lista_store.g.dart';

class PedidoListaStore = _PedidoListaStoreBase with _$PedidoListaStore;

abstract class _PedidoListaStoreBase with Store {
  @observable
  ObservableList pedidos = [].asObservable();

  @action
  void addPedido() {
    var pedidonew = Pedido();
    pedidos.add(pedidonew);
  }

  void limpar() {
    pedidos = [].asObservable();
  }
}
