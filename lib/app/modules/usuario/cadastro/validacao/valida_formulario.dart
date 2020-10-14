import 'package:flutter_modular/flutter_modular.dart';
import 'package:validators/validators.dart';

import '../../../../core/models/usuario.dart';
import '../../../../core/services/validadores.dart';
import '../cadastro_controller.dart';

class ValidaFormulario {
  Usuario usuario;

  String validar() {
    usuario = Modular.get<CadastroController>().usuario;

    var resultado = _nomeFantasia();
    resultado += _sobrenomeRazao();
    resultado += _telefone();
    resultado += _documento();
    resultado += _email();
    resultado += _senha();

    return resultado;
  }

  String _nomeFantasia() {
    if (usuario.nomeFantasia == null || usuario.nomeFantasia.isEmpty) {
      return usuario.tipoPessoa == 'PJ'
          ? 'Informe o Nome\n'
          : 'Informe o Nome Fantasia\n';
    }

    return '';
  }

  String _sobrenomeRazao() {
    if (usuario.sobrenomeRazao == null || usuario.sobrenomeRazao.isEmpty) {
      return usuario.tipoPessoa == 'PJ'
          ? 'Informe o sobrenome\n'
          : 'Informe o Razão Social\n';
    }

    return '';
  }

  String _telefone() {
    if (usuario.telefone == null || usuario.telefone.isEmpty) {
      return 'Informe o Telefone\n';
    }

    if (usuario.telefone.length < 15) {
      return 'Informe o telefone completo\n';
    }

    return '';
  }

  String _documento() {
    if (usuario.documento == null || usuario.documento.isEmpty) {
      return usuario.tipoPessoa == 'PJ'
          ? 'Informe o CNPJ\n'
          : 'Informe o CPF\n';
    }

    var documentoLimpo = Validadores.limpaMascara(usuario.documento);

    if (usuario.tipoPessoa == 'PJ') {
      if (!Validadores.cnpj(documentoLimpo)) {
        return 'Informe corretamente o CNPJ\n';
      }
    } else {
      if (!Validadores.cpf(documentoLimpo)) {
        return 'Informe corretamente o CPF\n';
      }
    }

    return '';
  }

  String _email() {
    if (usuario.email == null || usuario.email.isEmpty) {
      return 'Informe o Email\n';
    }

    if (!isEmail(usuario.email)) {
      return 'Informe o Email Corretamente\n';
    }

    return '';
  }

  String _senha() {
    if (usuario.senha == null || usuario.senha.isEmpty) {
      return 'Informe a Senha\n';
    }

    if (usuario.confirmacaoSenha == null || usuario.confirmacaoSenha.isEmpty) {
      return 'Informe a Confirmação da Senha\n';
    }

    if (usuario.senha.length < 8) {
      return 'A senha deve conter 8 digitos\n';
    }

    if (usuario.senha != usuario.confirmacaoSenha) {
      return 'A Confirmação de Senha não Confere';
    }

    return '';
  }
}
