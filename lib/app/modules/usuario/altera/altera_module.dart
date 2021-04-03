import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/interfaces/monitoramento_repository_interface.dart';
import '../../../core/repositories/monitoramento_repository.dart';
import '../repositories/interfaces/usuario_repository_interface.dart';
import '../repositories/usuario_repository.dart';
import 'altera_controller.dart';
import 'altera_page.dart';

class AlteraModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUsuarioRepository>((i) => UsuarioRepository(Modular.get<Dio>())),
        Bind((i) => AlteraController()),
        Bind<IMonitoramentoRepository>((i) {
          return MonitoramentoRepository(Modular.get<Dio>());
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/usuario/altera', child: (_, args) => AlterarPage()),
      ];

  static Inject get to => Inject<AlteraModule>.of();
}
