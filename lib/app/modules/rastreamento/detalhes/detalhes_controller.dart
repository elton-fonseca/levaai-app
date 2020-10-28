import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/pedido.dart';
import '../../../core/stores/pedido_lista_store.dart';

part 'detalhes_controller.g.dart';

@Injectable()
class DetalhesController = _DetalhesControllerBase with _$DetalhesController;

abstract class _DetalhesControllerBase with Store {
  void chamarPagamentoPedido(Map pedido, String tipo) {
    var listaPedido = Modular.get<PedidoListaStore>();
    var pedidoObjeto = Pedido();
    pedidoObjeto.idPedido = pedido['id'];

    listaPedido.pedidos.add(pedidoObjeto);

    listaPedido.valorTotalPedidos =
        double.parse(pedido['cotacao']['valor_calculado_cotacao']);

    Modular.to.popAndPushNamed('/pagamento/$tipo');
  }

  // ignore: missing_return
  String descritivoItem(Map item) {
    switch (item['tipo_item']) {
      case 'cubagem':
        return 'Cubagem ${item['cubagem']}';
        break;
      case 'caixaSapato':
        return 'Tamanho Aproximado Caixa de Sapato';
        break;
      case 'microondas':
        return 'Tamanho Aproximado Caixa de Sapato';
        break;
      case 'fogao':
        return 'Tamanho Aproximado Fogão';
        break;
      case 'geladeira':
        return 'Tamanho Aproximado Geladeira';
        break;
      case 'dimensoes':
        var d = "${item['largura']}x${item['altura']}x${item['comprimento']}";
        return 'Dimensões $d';
        break;
    }
  }
}
