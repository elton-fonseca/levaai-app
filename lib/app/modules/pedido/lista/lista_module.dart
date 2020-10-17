import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/interfaces/monitoramento_repository_interface.dart';
import '../../../core/repositories/monitoramento_repository.dart';
import '../repositories/interfaces/pedido_repository_interface.dart';
import '../repositories/pedido_repository.dart';
import 'lista_controller.dart';
import 'lista_page.dart';

class ListaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListaController()),
        Bind<IPedidoRepository>((i) => PedidoRepository(Modular.get<Dio>())),
        Bind<IMonitoramentoRepository>((i) {
          return MonitoramentoRepository(Modular.get<Dio>());
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/lista', child: (_, args) => ListaPage()),
      ];

  static Inject get to => Inject<ListaModule>.of();
}
