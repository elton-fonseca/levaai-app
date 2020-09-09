import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/pagamento/pagamento_module.dart';
import 'modules/pedido/pedido_module.dart';
import 'modules/usuario/usuario_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(Modular.initialRoute, module: PedidoModule()),
        ModularRouter(Modular.initialRoute, module: PagamentoModule()),
        ModularRouter(Modular.initialRoute, module: UsuarioModule()),
        ModularRouter(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
