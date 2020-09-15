import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/pagamento/pagamento_module.dart';
import 'modules/pedido/cotacao/cotacao_module.dart';
import 'modules/pedido/formulario/formulario_module.dart';
import 'modules/pedido/lista/lista_module.dart';
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
        // modulos de criação de pedidos
        ModularRouter(Modular.initialRoute, module: ListaModule()),
        ModularRouter(Modular.initialRoute, module: CotacaoModule()),
        ModularRouter(Modular.initialRoute, module: FormularioModule()),

        //Modulos de listagem e acompanhamento de pedido
        ModularRouter(Modular.initialRoute, module: RastreamentoModule()),
        ModularRouter(Modular.initialRoute, module: DetalhesModule()),

        ModularRouter(Modular.initialRoute, module: PagamentoModule()),
        ModularRouter(Modular.initialRoute, module: UsuarioModule()),
        ModularRouter(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
