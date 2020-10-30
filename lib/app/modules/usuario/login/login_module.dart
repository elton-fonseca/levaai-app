import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/interfaces/usuario_repository_interface.dart';
import '../repositories/usuario_repository.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'troca-senha/alterar_senha_controller.dart';
import 'troca-senha/gerar_token_controller.dart';
import 'troca-senha/trocar_senha_form_page.dart';
import 'troca-senha/trocar_senha_token_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IUsuarioRepository>((i) {
          return UsuarioRepository(Modular.get<Dio>());
        }),
        Bind((i) => LoginController()),
        Bind((i) => GerarTokenController()),
        Bind((i) => AlterarSenhaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login/formulario/:destino',
            child: (_, args) => LoginPage(destino: args.params['destino'])),
        ModularRouter('/login/trocar/senha/token',
            child: (_, args) => TrocarSenhaTokenPage()),
        ModularRouter('/login/trocar/senha/form',
            child: (_, args) => TrocarSenhaFormPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
