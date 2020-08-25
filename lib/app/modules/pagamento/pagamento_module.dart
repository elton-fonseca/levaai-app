import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pagamento_controller.dart';
import 'pagamento_page.dart';
import 'repositories/interfaces/pagamento_repository_interface.dart';
import 'repositories/pagamento_repository.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPagamentoRepository>((i) => PagamentoRepository(Dio())),
        Bind((i) => PagamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/pagamento', child: (_, args) => PagamentoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
