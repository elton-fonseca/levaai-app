import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'lista_pedido_controller.g.dart';

@Injectable()
class ListaPedidoController = _ListaPedidoControllerBase
    with _$ListaPedidoController;

abstract class _ListaPedidoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
