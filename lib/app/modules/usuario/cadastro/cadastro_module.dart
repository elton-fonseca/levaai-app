import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/interfaces/monitoramento_repository_interface.dart';
import '../../../core/repositories/monitoramento_repository.dart';
import '../repositories/interfaces/usuario_repository_interface.dart';
import '../repositories/usuario_repository.dart';
import 'cadastro_controller.dart';
import 'cadastro_page.dart';

class CadastroModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUsuarioRepository>((i) => UsuarioRepository(Modular.get<Dio>())),
        Bind((i) => CadastroController()),
        Bind<IMonitoramentoRepository>((i) {
          return MonitoramentoRepository(Modular.get<Dio>());
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/usuario/cadastro', child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<CadastroModule>.of();
}
