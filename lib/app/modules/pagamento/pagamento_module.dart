import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/repositories/interfaces/monitoramento_repository_interface.dart';
import '../../core/repositories/monitoramento_repository.dart';
import '../pedido/repositories/interfaces/pedido_repository_interface.dart';
import '../pedido/repositories/pedido_repository.dart';
import 'confirmacao_page.dart';
import 'pagamento_controller.dart';
import 'pagamento_page.dart';
import 'repositories/interfaces/pagamento_repository_interface.dart';
import 'repositories/pagamento_repository.dart';
import 'widgets/cartao/dados_cartao_controller.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPagamentoRepository>(
            (i) => PagamentoRepository(Modular.get<Dio>())),
        Bind<IPedidoRepository>((i) => PedidoRepository(Modular.get<Dio>())),
        Bind((i) => PagamentoController()),
        Bind((i) => DadosCartaoController()),
        Bind<IMonitoramentoRepository>((i) {
          return MonitoramentoRepository(Modular.get<Dio>());
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pagamento/:acao',
            child: (_, args) => PagamentoPage(acao: args.params['acao'])),
        ModularRouter('/pagamento/confirmacao',
            child: (_, args) => ConfirmacaoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
