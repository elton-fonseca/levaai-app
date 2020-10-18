import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/stores/identificacao_store.dart';
import 'interfaces/usuario_repository_interface.dart';

class UsuarioRepository implements IUsuarioRepository {
  final DioForNative client;

  UsuarioRepository(this.client);

  Future login(String email, String senha) async {
    var corpo = {};
    corpo["email"] = email;
    corpo["senha"] = senha;
    corpo["dispositivo"] = Modular.get<IdentificacaoStore>().idDispositivo;

    var dados = json.encode(corpo);

    final response = await client.post(
      '/cliente/login',
      data: dados,
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao validar usuário ou senha");
  }

  Future cadastrar(String dados) async {
    final response = await client.post(
      '/cliente',
      data: dados,
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao criar usuário");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
