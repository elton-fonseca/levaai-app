// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identificacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IdentificacaoStore on _IdentificacaoStoreBase, Store {
  final _$idDispositivoAtom =
      Atom(name: '_IdentificacaoStoreBase.idDispositivo');

  @override
  String get idDispositivo {
    _$idDispositivoAtom.reportRead();
    return super.idDispositivo;
  }

  @override
  set idDispositivo(String value) {
    _$idDispositivoAtom.reportWrite(value, super.idDispositivo, () {
      super.idDispositivo = value;
    });
  }

  @override
  String toString() {
    return '''
idDispositivo: ${idDispositivo}
    ''';
  }
}
