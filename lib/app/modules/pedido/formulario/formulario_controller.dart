import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'formulario_controller.g.dart';

@Injectable()
class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  int indice = 0;

  void enviar(String acao) {
    Modular.to.pushNamed('/pedido/cotacao/$indice/$acao');
  }
}
