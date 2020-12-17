import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/services/local_storage.dart';
import '../../../core/stores/pedido_lista_store.dart';
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
        duration: Duration(seconds: 7),
      );
      Scaffold.of(context).showSnackBar(scnackbar);
    }
  }

  @action
  void defineValorTotal(MoneyMaskedTextController textController) {
    textController.afterChange = (previous, next) {
      var novoValorTotal = previous.replaceAll('.', '').replaceFirst(',', '.');

      var pedidoLista = Modular.get<PedidoListaStore>().pedidos[indice];
      pedidoLista.valorTotal = double.parse(novoValorTotal);

      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length));

      return true;
    };
  }

  @action
  void definePesoTotal(MoneyMaskedTextController textController) {
    textController.afterChange = (previous, next) {
      var pedidoLista = Modular.get<PedidoListaStore>().pedidos[indice];
      pedidoLista.pesoTotal = previous;

      textController.selection = TextSelection.fromPosition(
          TextPosition(offset: textController.text.length));

      return true;
    };
  }

  void avisoLocaisAtendidos(BuildContext context) {
    LocalStorage.getValue<bool>("aviso-local-atendido").then((jaFoiMostrado) {
      if (jaFoiMostrado == false) {
        showDialog(
          context: context,
          builder: (context) {
            // retorna um objeto do tipo Dialog
            return AlertDialog(
              title: Text('Locais Atendidos'),
              content: Text('Atendemos as seguintes regiões do Estado de SP: '
                  'São Paulo, Grande SP, Vale do Paraíba, Litoral Norte e Sul '
                  'e Campinas'),
              actions: <Widget>[
                // define os botões na base do dialogo
                FlatButton(
                  child: Text("Cidades Atendidas"),
                  onPressed: () async {
                    var url = 'https://www.levaai.com.br/regioesatendidas/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Caminho não encontrado';
                    }
                  },
                ),
                FlatButton(
                  child: Text("Fechar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

        LocalStorage.setValue<bool>('aviso-local-atendido', true);
      }
    });
  }
}
