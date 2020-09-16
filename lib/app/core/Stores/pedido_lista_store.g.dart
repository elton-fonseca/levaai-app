// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedido_lista_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PedidoListaStore on _PedidoListaStoreBase, Store {
  final _$pedidosAtom = Atom(name: '_PedidoListaStoreBase.pedidos');

  @override
  ObservableList<dynamic> get pedidos {
    _$pedidosAtom.reportRead();
    return super.pedidos;
  }

  @override
  set pedidos(ObservableList<dynamic> value) {
    _$pedidosAtom.reportWrite(value, super.pedidos, () {
      super.pedidos = value;
    });
  }

  final _$caixaSapatoAtom = Atom(name: '_PedidoListaStoreBase.caixaSapato');

  @override
  int get caixaSapato {
    _$caixaSapatoAtom.reportRead();
    return super.caixaSapato;
  }

  @override
  set caixaSapato(int value) {
    _$caixaSapatoAtom.reportWrite(value, super.caixaSapato, () {
      super.caixaSapato = value;
    });
  }

  final _$_PedidoListaStoreBaseActionController =
      ActionController(name: '_PedidoListaStoreBase');

  @override
  void addPedido() {
    final _$actionInfo = _$_PedidoListaStoreBaseActionController.startAction(
        name: '_PedidoListaStoreBase.addPedido');
    try {
      return super.addPedido();
    } finally {
      _$_PedidoListaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void defineEndereco(String novoEndereco, int id) {
    final _$actionInfo = _$_PedidoListaStoreBaseActionController.startAction(
        name: '_PedidoListaStoreBase.defineEndereco');
    try {
      return super.defineEndereco(novoEndereco, id);
    } finally {
      _$_PedidoListaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pedidos: ${pedidos},
caixaSapato: ${caixaSapato}
    ''';
  }
}
