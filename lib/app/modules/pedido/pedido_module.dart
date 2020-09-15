import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/pedido_controller.dart';
import 'pages/pedido_cotacao_page.dart';
import 'pages/pedido_formulario_page.dart';
import 'pages/pedido_lista_page.dart';
import 'repositories/interfaces/pedido_repository_interface.dart';
import 'repositories/pedido_repository.dart';

class PedidoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPedidoRepository>((i) => PedidoRepository(Dio())),
        Bind((i) => PedidoController(), singleton: true),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/formulario/:id/:acao',
            child: (_, args) => PedidoFormularioPage(
                id: int.parse(args.params['id']), acao: args.params['acao'])),
        ModularRouter('/pedido/cotacao',
            child: (_, args) => PedidoCotacaoPage()),
        ModularRouter('/pedido/destalhes',
            child: (_, args) => PedidoListaPage()),
      ];

  static Inject get to => Inject<PedidoModule>.of();
}
