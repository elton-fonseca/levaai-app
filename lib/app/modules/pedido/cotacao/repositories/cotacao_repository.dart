import 'dart:convert';

import 'package:dio/native_imp.dart';

import '../../../../core/models/cotacao.dart';
import '../../../../core/services/validadores.dart';
import 'interfaces/cotacao_repository_interface.dart';

class CotacaoRepository implements ICotacaoRepository {
  DioForNative client;

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

  Future verificarTDE(String cnpjOrigem, String cnpjDestino) async {
    var cnpjs = {
      'cnpj_origem': Validadores.limpaMascara(cnpjOrigem),
      'cnpj_destino': Validadores.limpaMascara(cnpjDestino),
    };

    final response = await client.post(
      '/verificar-cnpj-tde',
      data: jsonEncode(cnpjs),
    );

    if (response.statusCode == 200) {
      return response.data;
    }

    throw ("Erro ao buscar Cnpj");
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
