import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/pagamento/pagamento_module.dart';
import 'modules/pedido/pedido_module.dart';
import 'modules/rastreamento/detalhes/detalhes_module.dart';
import 'modules/rastreamento/rastreamento_module.dart';
import 'modules/usuario/usuario_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<Dio>((i) {
          var dioClient = Dio();

          dioClient.options.baseUrl = "http://192.168.15.12/api";
          dioClient.options.headers['content-Type'] = 'application/json';
          dioClient.options.headers["Api-token"] =
              '\$2a\$07\$usesomesillystringforeGsJAIIu7nhlxWq.cvdNluLcR1KdMYnq';

          return dioClient;
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter(Modular.initialRoute, module: PedidoModule()),
        ModularRouter(Modular.initialRoute, module: PagamentoModule()),
        ModularRouter(Modular.initialRoute, module: UsuarioModule()),
        ModularRouter(Modular.initialRoute, module: LoginModule()),
        ModularRouter(Modular.initialRoute, module: RastreamentoModule()),
        ModularRouter(Modular.initialRoute, module: DetalhesModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
