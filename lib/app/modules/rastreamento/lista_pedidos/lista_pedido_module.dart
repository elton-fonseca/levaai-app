import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/interfaces/rastreamento_repository_interface.dart';
import '../repositories/rastreamento_repository.dart';
import 'lista_pedido_controller.dart';
import 'lista_pedido_page.dart';

class ListaPedidoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRastreamentoRepository>(
            (i) => RastreamentoRepository(Modular.get<Dio>())),
        Bind((i) => ListaPedidoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/rastreamento/lista',
            child: (_, args) => ListaPedidoPage()),
      ];

  static Inject get to => Inject<ListaPedidoModule>.of();
}
