import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/pedido_form_controller.dart';

import 'pages/pedido_cotacao_page.dart';
import 'pages/pedido_detalhes_page.dart';
import 'pages/pedido_form_page.dart';
import 'pages/pedido_listar_page.dart';

import 'repositories/interfaces/pedido_repository_interface.dart';
import 'repositories/pedido_repository.dart';

class PedidoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPedidoRepository>((i) => PedidoRepository(Dio())),
        Bind((i) => PedidoFormController()),
      ];

  @override
  List<Router> get routers => [
        Router('/pedido/form', child: (_, args) => PedidoFormPage()),
        Router('/pedido/cotacao', child: (_, args) => PedidoCotacaoPage()),
        Router('/pedido/listar', child: (_, args) => PedidoListarPage()),
        Router('/pedido/destalhes', child: (_, args) => PedidoDetalhesPage()),
      ];

  static Inject get to => Inject<PedidoModule>.of();
}
