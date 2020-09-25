import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../pedido/repositories/interfaces/pedido_repository_interface.dart';
import '../pedido/repositories/pedido_repository.dart';
import 'pagamento_controller.dart';
import 'pagamento_page.dart';
import 'repositories/interfaces/pagamento_repository_interface.dart';
import 'repositories/pagamento_repository.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPagamentoRepository>(
            (i) => PagamentoRepository(Modular.get<Dio>())),
        Bind<IPedidoRepository>(
            (i) => PedidoRepository(Modular.get<Dio>())),
        Bind((i) => PagamentoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pagamento', child: (_, args) => PagamentoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
