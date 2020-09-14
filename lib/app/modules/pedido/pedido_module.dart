import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'controllers/pedido_controller.dart';
import 'pages/pedido_cotacao_page.dart';
import 'pages/pedido_detalhes_page.dart';
import 'pages/pedido_formulario_page.dart';

import 'repositories/interfaces/pedido_repository_interface.dart';
import 'repositories/pedido_repository.dart';

class PedidoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPedidoRepository>((i) => PedidoRepository(Dio())),
        Bind((i) => PedidoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/formulario/:id',
            child: (_, args) => PedidoFormularioPage(id: args.params['id'])),
        ModularRouter('/pedido/cotacao',
            child: (_, args) => PedidoCotacaoPage()),
        ModularRouter('/pedido/destalhes',
            child: (_, args) => PedidoDetalhesPage()),
      ];

  static Inject get to => Inject<PedidoModule>.of();
}
