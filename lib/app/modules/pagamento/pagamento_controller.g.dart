// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagamentoController on _PagamentoControllerBase, Store {
  final _$pagamentoAtom = Atom(name: '_PagamentoControllerBase.pagamento');

  @override
  Pagamento get pagamento {
    _$pagamentoAtom.reportRead();
    return super.pagamento;
  }

  @override
  set pagamento(Pagamento value) {
    _$pagamentoAtom.reportWrite(value, super.pagamento, () {
      super.pagamento = value;
    });
  }

  final _$_PagamentoControllerBaseActionController =
      ActionController(name: '_PagamentoControllerBase');

  @override
  void defineTipoPagamento(String novoTipoPagamento) {
    final _$actionInfo = _$_PagamentoControllerBaseActionController.startAction(
        name: '_PagamentoControllerBase.defineTipoPagamento');
    try {
      return super.defineTipoPagamento(novoTipoPagamento);
    } finally {
      _$_PagamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pagamento: ${pagamento}
    ''';
  }
}
