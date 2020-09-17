import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/Stores/pedido_lista_store.dart';
import 'package:levaai1/app/modules/pedido/formulario/validacao/valida_formulario.dart';
import 'package:mobx/mobx.dart';

part 'formulario_controller.g.dart';

@Injectable()
class FormularioController = _FormularioControllerBase
    with _$FormularioController;

abstract class _FormularioControllerBase with Store {
  int indice = 0;

  void enviar(BuildContext context, String acao) {
    //Modular.to.pushNamed('/pedido/cotacao/$indice/$acao');

    var pedido = Modular.get<PedidoListaStore>().pedidos[indice];

    if (ValidaFormulario(pedido).validar().isEmpty) {

    }

    var scnackbar = SnackBar(
      content: Text("Usuário ou senha invalidos"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 10),
    );
    Scaffold.of(context).showSnackBar(scnackbar);
  }
}
