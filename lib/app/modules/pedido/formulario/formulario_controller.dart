import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/Stores/pedido_lista_store.dart';

part 'formulario_controller.g.dart';

@Injectable()
class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  int indice = 0;

  int itemCaixaSapato() {
    return Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato;
  }

  @action
  void addItemCaixaSapato() {
    Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato++;
  }

  @action
  void rmItemCaixaSapato() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].caixaSapato--;
    }
  }

  int itemMicroondas() {
    return Modular.get<PedidoListaStore>().pedidos[indice].microondas;
  }

  @action
  void addItemMicroondas() {
    Modular.get<PedidoListaStore>().pedidos[indice].microondas++;
  }

  @action
  void rmItemMicroondas() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].microondas;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].microondas--;
    }
  }

  int itemFogao() {
    return Modular.get<PedidoListaStore>().pedidos[indice].fogao;
  }

  @action
  void addItemFogao() {
    Modular.get<PedidoListaStore>().pedidos[indice].fogao++;
  }

  @action
  void rmItemFogao() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].fogao;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].fogao--;
    }
  }

  int itemGeladeira() {
    return Modular.get<PedidoListaStore>().pedidos[indice].geladeira;
  }

  @action
  void addItemGeladeira() {
    Modular.get<PedidoListaStore>().pedidos[indice].geladeira++;
  }

  @action
  void rmItemGeladeira() {
    var qtd = Modular.get<PedidoListaStore>().pedidos[indice].geladeira;

    if (qtd > 0) {
      Modular.get<PedidoListaStore>().pedidos[indice].geladeira--;
    }
  }

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
}
