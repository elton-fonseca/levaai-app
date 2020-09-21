import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/interfaces/usuario_repository_interface.dart';
import '../repositories/usuario_repository.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUsuarioRepository>((i) {
          return UsuarioRepository(Modular.get<Dio>());
        }),
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login/formulario', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
