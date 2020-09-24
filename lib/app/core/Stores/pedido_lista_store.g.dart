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

  final _$valorTotalPedidosAtom =
      Atom(name: '_PedidoListaStoreBase.valorTotalPedidos');

  @override
  double get valorTotalPedidos {
    _$valorTotalPedidosAtom.reportRead();
    return super.valorTotalPedidos;
  }

  @override
  set valorTotalPedidos(double value) {
    _$valorTotalPedidosAtom.reportWrite(value, super.valorTotalPedidos, () {
      super.valorTotalPedidos = value;
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
  String toString() {
    return '''
pedidos: ${pedidos},
valorTotalPedidos: ${valorTotalPedidos}
    ''';
  }
}
