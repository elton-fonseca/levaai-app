import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/services/informacoes_dispositivo.dart';
import '../../core/services/local_storage.dart';
import '../../core/stores/identificacao_store.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  void boot() {
    LocalStorage.getValue<String>("token").then((token) {
      return Future.delayed(const Duration(seconds: 2), () {
        if (token.toString().isNotEmpty) {
          Modular.to.popAndPushNamed('/rastreamento/lista');
          Modular.get<Dio>().options.headers["Authorization"] = 'Bearer $token';
        } else {
          Modular.to.popAndPushNamed('/home');
        }
      });
    });

    InformacoesDispositivo.getDeviceId().then((value) {
      Modular.get<IdentificacaoStore>().idDispositivo = value;
    });
  }
}
