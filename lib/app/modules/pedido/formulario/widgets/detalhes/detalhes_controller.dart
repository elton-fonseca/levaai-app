import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';

part 'detalhes_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  int indice = 0;

  @action
  void definePesoTotal(String novoPesoTotal) {
    Modular.get<PedidoListaStore>().pedidos[indice].pesoTotal = novoPesoTotal;
  }

  String pegaPesoTotal() {
    var novoPeso = Modular.get<PedidoListaStore>().pedidos[indice].pesoTotal;

    if (novoPeso != null) {
      return novoPeso;
    }

    return "selecione";
  }

  @action
  void defineTipoMercadoria(String novotipoMercadoria) {
    Modular.get<PedidoListaStore>().pedidos[indice].tipoMercadoria =
        novotipoMercadoria;
  }

  String pegaTipoMercadoria() {
    var tipoMercadoria =
        Modular.get<PedidoListaStore>().pedidos[indice].tipoMercadoria;

    if (tipoMercadoria != null) {
      return tipoMercadoria;
    }

    return "selecione";
  }

  String pegaValorTotal() {
    return Modular.get<PedidoListaStore>()
        .pedidos[indice]
        .valorTotal
        .toString();
  }
}
