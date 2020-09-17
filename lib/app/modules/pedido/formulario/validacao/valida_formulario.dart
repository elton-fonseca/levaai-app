import 'package:flutter/material.dart';
import 'package:levaai1/app/core/Models/pedido.dart';
import 'package:validators/validators.dart';

class ValidaFormulario {
  ValidaFormulario(Pedido pedido) : pedido = pedido;

  Pedido pedido;

  String validar() {
    var resultado = '';

    resultado = _endereco();

    return resultado;
  }

  String _endereco() {
    if (pedido.enderecoOrigem.isEmpty) {
      return 'Informe o Endereço de Origem';
    }
  }

  String _itens() {
    //if (endereco.isEmpty) {
    //  return 'Preencha o email';
    //}

    return null;
  }

  String _valorTotal() {
    //if (endereco.isEmpty) {
    //  return 'Preencha o email';
    //}

    return null;
  }

  String _pesoTotal() {
    //if (endereco.isEmpty) {
    //  return 'Preencha o email';
    //}

    return null;
  }

  String _tipo() {
    //if (endereco.isEmpty) {
    //  return 'Preencha o email';
    //}

    return null;
  }
}
