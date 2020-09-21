// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Pagamento on _PagamentoBase, Store {
  final _$tipoPagamentoAtom = Atom(name: '_PagamentoBase.tipoPagamento');

  @override
  String get tipoPagamento {
    _$tipoPagamentoAtom.reportRead();
    return super.tipoPagamento;
  }

  @override
  set tipoPagamento(String value) {
    _$tipoPagamentoAtom.reportWrite(value, super.tipoPagamento, () {
      super.tipoPagamento = value;
    });
  }

  @override
  String toString() {
    return '''
tipoPagamento: ${tipoPagamento}
    ''';
  }
}
