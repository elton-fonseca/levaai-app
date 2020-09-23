import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/core/view/helpers.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/models/itens_pedido.dart';
import '../../../../../core/stores/pedido_lista_store.dart';
import '../tipo_medida/tipo_medida_controller.dart';
import 'validacao/valida_formulario.dart';
import 'widgets/cubagem.dart';
import 'widgets/dimensoes.dart';

part 'popup_controller.g.dart';

@Injectable()
class PopupController = _PopupControllerBase with _$PopupController;

abstract class _PopupControllerBase with Store {
  _PopupControllerBase(this.pedidoLista);

  PedidoListaStore pedidoLista;

  int indice = 0;

  @observable
  Widget tipoForm = Dimensoes();

  @observable
  int quantidade = 0;

  int largura = 0;
  int altura = 0;
  int comprimento = 0;
  int cubagem = 0;

  @action
  void definirFormDimensoes() {
    tipoForm = Dimensoes();
  }

  @action
  void definirFormCubagem() {
    tipoForm = Cubagem();
  }

  @action
  void addQuantidade() {
    quantidade++;
  }

  @action
  void rmQuantidade() {
    if (quantidade > 0) {
      quantidade--;
    }
  }

  void adicionarItemPedido(BuildContext context) {
    var item = ItensPedido(quantidade: quantidade);

    var validacao = ValidaFormulario(this).validar();

    if (validacao.isNotEmpty) {
      Helpers.alerta(
          context: context, titulo: 'Validação', descricao: validacao);
      return;
    }

    if (tipoForm is Dimensoes) {
      item.altura = altura;
      item.largura = largura;
      item.comprimento = comprimento;
    } else {
      item.cubagem = cubagem;
    }

    pedidoLista.pedidos[indice].addItemPedido(item);

    Modular.get<TipoMedidaController>().definirMedidaExata();

    _limpar();

    Modular.to.pop();
  }

  String volumeFormatado(ItensPedido item) {
    if (item.cubagem == 0) {
      var resultado = 'Dimensões: ${item.largura.toString()}x';
      resultado += '${item.altura.toString()}x';
      resultado += '${item.comprimento.toString()}';

      return resultado;
    }

    return 'Cubagem: ${item.cubagem.toString()}';
  }

  void _limpar() {
    altura = 0;
    largura = 0;
    comprimento = 0;
    cubagem = 0;
    quantidade = 0;

    var pedido = pedidoLista.pedidos[indice];
    pedido.caixaSapato = 0;
    pedido.microondas = 0;
    pedido.fogao = 0;
    pedido.geladeira = 0;
  }
}
