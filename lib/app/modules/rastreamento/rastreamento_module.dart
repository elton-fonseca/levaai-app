import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'rastreamento_controller.dart';
import 'rastreamento_page.dart';
import 'repositories/interfaces/rastreamento_repository_interface.dart';
import 'repositories/rastreamento_repository.dart';

class RastreamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRastreamentoRepository>((i) => RastreamentoRepository(Dio())),
        Bind((i) => RastreamentoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/rastreamento/lista',
            child: (_, args) => RastreamentoPage()),
      ];

  static Inject get to => Inject<RastreamentoModule>.of();
}
