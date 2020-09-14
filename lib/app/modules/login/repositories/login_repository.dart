import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'interfaces/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final DioForNative client;

  LoginRepository(this.client);

  Future login(String email, String senha) async {
    var corpo = {};
    corpo["nome"] = "joao";
    corpo["email"] = email;
    corpo["senha"] = senha;
    corpo["dispositivo"] = "teste";

    print(json.encode(corpo).toString());

    final response = await client.post(
      '/cliente/login',
      data: json.encode(corpo).toString(),
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao validar usuário ou senha");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
