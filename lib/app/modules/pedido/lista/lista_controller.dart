import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/services/local_storage.dart';

part 'lista_controller.g.dart';

@Injectable()
class ListaController = _ListaControllerBase with _$ListaController;

abstract class _ListaControllerBase with Store {
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
