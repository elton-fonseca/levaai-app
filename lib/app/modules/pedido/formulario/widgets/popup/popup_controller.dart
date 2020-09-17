import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/Models/itens_pedido.dart';
import '../../../../../core/Stores/pedido_lista_store.dart';
import '../tipo_medida/tipo_medida_controller.dart';
import 'widgets/cubagem.dart';
import 'widgets/dimensoes.dart';

part 'popup_controller.g.dart';

@Injectable()
class PopupController = _PopupControllerBase with _$PopupController;

abstract class _PopupControllerBase with Store {
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

  void defineLargura(int valor) {
    largura = valor;
  }

  void defineAltura(int valor) {
    altura = valor;
  }

  void defineComprimento(int valor) {
    comprimento = valor;
  }

  void defineCubagem(int valor) {
    cubagem = valor;
  }

  void adicionarItemPedido() {
    var item = ItensPedido(
      altura: altura,
      largura: largura,
      comprimento: comprimento,
    );

    Modular.get<PedidoListaStore>().pedidos[indice].addItemPedido(item);

    Modular.get<TipoMedidaController>().definirMedidaExata();

    Modular.to.pop();
  }
}
