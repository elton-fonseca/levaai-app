import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

import 'controllers/usuario_controller.dart';
import 'pages/cadastro_page.dart';
import 'repositories/interfaces/usuario_repository_interface.dart';
import 'repositories/usuario_repository.dart';

class UsuarioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUsuarioRepository>((i) => UsuarioRepository(Dio())),
        Bind((i) => UsuarioController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/usuario/cadastro', child: (_, args) => CadastroPage()),
      ];

  static Inject get to => Inject<UsuarioModule>.of();
}
