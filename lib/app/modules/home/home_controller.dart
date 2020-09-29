import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/services/informacoes_dispositivo.dart';
import '../../core/services/local_storage.dart';
import '../../core/stores/identificacao_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  void boot() {
    LocalStorage.getValue<String>("token").then((token) {
      if (token.toString().isNotEmpty) {
        Modular.to.popAndPushNamed('/rastreamento/lista');
        Modular.get<Dio>().options.headers["Authorization"] = 'Bearer $token';
      }
    });

    InformacoesDispositivo.getDeviceId().then((value) {
      Modular.get<IdentificacaoStore>().idDispositivo = value;
    });
  }
}
