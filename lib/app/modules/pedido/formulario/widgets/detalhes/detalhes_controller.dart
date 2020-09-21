import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/stores/pedido_lista_store.dart';

part 'formulario_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase
    with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  int indice = 0;

  //detalhes 
  @action
  void definePesoTotal(String novoPesoTotal) {
    Modular.get<PedidoListaStore>().pedidos[indice].pesoTotal =
        int.parse(novoPesoTotal);
  }

  String pegaPesoTotal() {
    var pesoTotal = Modular.get<PedidoListaStore>().pedidos[indice].pesoTotal;

    if (pesoTotal != null) {
      return pesoTotal.toString();
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

  @action
  void defineValorTotal(String novoValorTotal) {
    Modular.get<PedidoListaStore>().pedidos[indice].valorTotal = novoValorTotal;
  }

  String pegaValorTotal() {
    return Modular.get<PedidoListaStore>().pedidos[indice].valorTotal;
  }

}
