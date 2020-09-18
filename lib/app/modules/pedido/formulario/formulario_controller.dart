import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/Stores/pedido_lista_store.dart';
import 'validacao/valida_formulario.dart';

part 'formulario_controller.g.dart';

@Injectable()
class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  int indice = 0;

  void enviar(BuildContext context, String acao) {
    var pedido = Modular.get<PedidoListaStore>().pedidos[indice];
    var validacao = ValidaFormulario(pedido).validar();

    if (validacao.isEmpty) {
      Modular.to.pushNamed('/pedido/cotacao/$indice/$acao');
    } else {
      var scnackbar = SnackBar(
        content: Text(validacao),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 10),
      );
      Scaffold.of(context).showSnackBar(scnackbar);
    }
  }
}
