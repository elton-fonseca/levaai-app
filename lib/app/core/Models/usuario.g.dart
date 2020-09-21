// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Usuario on _PedidoBase, Store {
  final _$tipoPessoaAtom = Atom(name: '_PedidoBase.tipoPessoa');

  @override
  String get tipoPessoa {
    _$tipoPessoaAtom.reportRead();
    return super.tipoPessoa;
  }

  @override
  set tipoPessoa(String value) {
    _$tipoPessoaAtom.reportWrite(value, super.tipoPessoa, () {
      super.tipoPessoa = value;
    });
  }

  @override
  String toString() {
    return '''
tipoPessoa: ${tipoPessoa}
    ''';
  }
}
