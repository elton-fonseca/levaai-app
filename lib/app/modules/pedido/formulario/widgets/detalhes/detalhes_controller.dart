import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';

part 'formulario_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  _DetalhesControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  //detalhes
  @action
  void definePesoTotal(String novoPesoTotal) {
    pedidoLista.pedidos[indice].pesoTotal = int.parse(novoPesoTotal);
  }

  String pegaPesoTotal() {
    var pesoTotal = pedidoLista.pedidos[indice].pesoTotal;

    if (pesoTotal != null) {
      return pesoTotal.toString();
    }

    return "selecione";
  }

  @action
  void defineTipoMercadoria(String novotipoMercadoria) {
    pedidoLista.pedidos[indice].tipoMercadoria = novotipoMercadoria;
  }

  String pegaTipoMercadoria() {
    var tipoMercadoria = pedidoLista.pedidos[indice].tipoMercadoria;

    if (tipoMercadoria != null) {
      return tipoMercadoria;
    }

    return "selecione";
  }

  @action
  void defineValorTotal(String novoValorTotal) {
    pedidoLista.pedidos[indice].valorTotal = novoValorTotal;
  }

  String pegaValorTotal() {
    return pedidoLista.pedidos[indice].valorTotal;
  }
}
