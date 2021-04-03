import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../services/validadores.dart';
import '../stores/identificacao_store.dart';

part 'usuario.g.dart';

class Usuario = _UsuarioBase with _$Usuario;

abstract class _UsuarioBase with Store {
  @observable
  String tipoPessoa = 'PF';

  String nomeFantasia;
  String sobrenomeRazao;

  String telefone;
  String documento;

  String email;
  String senha;
  String confirmacaoSenha;

  Map<String, dynamic> usuarioParaJson() {
    final data = <String, dynamic>{};
    data['tipo'] = tipoPessoa;
    data['nome'] = nomeFantasia;
    data['sobrenome'] = sobrenomeRazao;
    data['telefone'] = Validadores.limpaMascara(telefone);
    data['documento'] = Validadores.limpaMascara(documento);
    data['email'] = email;
    data['senha'] = senha;

    data['dispositivo'] = Modular.get<IdentificacaoStore>().idDispositivo;

    return data;
  }

  Map<String, dynamic> usuarioAlterarParaJson() {
    final data = <String, dynamic>{};
    data['nome'] = nomeFantasia;
    data['sobrenome'] = sobrenomeRazao;
    data['telefone'] = Validadores.limpaMascara(telefone);
    data['documento'] = Validadores.limpaMascara(documento);
    data['email'] = email;

    return data;
  }
}
