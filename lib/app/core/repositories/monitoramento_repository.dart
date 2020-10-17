import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/identificacao_store.dart';
import 'interfaces/monitoramento_repository_interface.dart';

class MonitoramentoRepository implements IMonitoramentoRepository {
  DioForNative client;

  MonitoramentoRepository(this.client);

  Future registrarAcao(String acao) async {
    var acaoMap = {'acao': acao};
    acaoMap['identificacao_device'] =
        Modular.get<IdentificacaoStore>().idDispositivo;

    final response = await client.post(
      '/monitoramento/acao',
      data: jsonEncode(acaoMap),
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
