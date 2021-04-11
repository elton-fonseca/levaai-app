import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/stores/identificacao_store.dart';
import 'core/stores/pedido_lista_store.dart';
import 'modules/home/home_module.dart';
import 'modules/pagamento/pagamento_module.dart';
import 'modules/pedido/cotacao/cotacao_module.dart';
import 'modules/pedido/formulario/formulario_module.dart';
import 'modules/pedido/lista/lista_module.dart';
import 'modules/rastreamento/detalhes/detalhes_module.dart';
import 'modules/rastreamento/lista_pedidos/lista_pedido_module.dart';
import 'modules/splash/splash_module.dart';
import 'modules/usuario/altera/altera_module.dart';
import 'modules/usuario/cadastro/cadastro_module.dart';
import 'modules/usuario/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => PedidoListaStore()),
        Bind((i) => IdentificacaoStore()),
        Bind<Dio>((i) {
          var dioClient = Dio();

          dioClient.options.baseUrl = "http://192.168.15.5/api";
          //dioClient.options.baseUrl = "https://vps27642.publiccloud.com.br/api";
          //dioClient.options.baseUrl = "https://levaai-api.eltonfonseca.dev/api";

          dioClient.options.headers['content-Type'] = 'application/json';
          dioClient.options.headers["Api-token"] =
              '\$2a\$07\$usesomesillystringforeGsJAIIu7nhlxWq.cvdNluLcR1KdMYnq';

          return dioClient;
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: SplashModule()),
        ModularRouter(Modular.initialRoute, module: HomeModule()),

        // modulos de criação de pedidos
        ModularRouter(Modular.initialRoute, module: ListaModule()),
        ModularRouter(Modular.initialRoute, module: CotacaoModule()),
        ModularRouter(Modular.initialRoute, module: FormularioModule()),

        //Modulos de listagem e acompanhamento de pedido
        ModularRouter(Modular.initialRoute, module: ListaPedidoModule()),
        ModularRouter(Modular.initialRoute, module: DetalhesModule()),

        ModularRouter(Modular.initialRoute, module: PagamentoModule()),

        //cadastro e login de usuario
        ModularRouter(Modular.initialRoute, module: CadastroModule()),
        ModularRouter(Modular.initialRoute, module: AlteraModule()),
        ModularRouter(Modular.initialRoute, module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
