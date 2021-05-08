// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endereco_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EnderecoController on _EnderecoControllerBase, Store {
  final _$_EnderecoControllerBaseActionController =
      ActionController(name: '_EnderecoControllerBase');

  @override
  void autocompleteEndereco(
      {String cep,
      @required TextEditingController logradouroTextController,
      @required TextEditingController bairroTextController}) {
    final _$actionInfo = _$_EnderecoControllerBaseActionController.startAction(
        name: '_EnderecoControllerBase.autocompleteEndereco');
    try {
      return super.autocompleteEndereco(
          cep: cep,
          logradouroTextController: logradouroTextController,
          bairroTextController: bairroTextController);
    } finally {
      _$_EnderecoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
