import 'dart:convert';

import 'package:dio/native_imp.dart';
import '../../../../core/models/cotacao.dart';
import 'interfaces/cotacao_repository_interface.dart';

class CotacaoRepository implements ICotacaoRepository {
  final DioForNative client;

  CotacaoRepository(this.client);

  Future cotar(String dados) async {

    final response = await client.post(
      '/cotar',
      data: dados,
    );

    if (response.statusCode == 200) {
      return Cotacao.fromJson(response.data);
    }

    throw ("Erro ao validar usuário ou senha");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
