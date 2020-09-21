// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$pjAtom = Atom(name: '_CadastroControllerBase.pj');

  @override
  bool get pj {
    _$pjAtom.reportRead();
    return super.pj;
  }

  @override
  set pj(bool value) {
    _$pjAtom.reportWrite(value, super.pj, () {
      super.pj = value;
    });
  }

  final _$_CadastroControllerBaseActionController =
      ActionController(name: '_CadastroControllerBase');

  @override
  void alteraTipoPessoa() {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.alteraTipoPessoa');
    try {
      return super.alteraTipoPessoa();
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pj: ${pj}
    ''';
  }
}
