import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:levaai1/app/modules/pagamento/widgets/cartao/dados_cartao_controller.dart';

import '../pedido/repositories/interfaces/pedido_repository_interface.dart';
import '../pedido/repositories/pedido_repository.dart';
import 'confirmacao_page.dart';
import 'pagamento_controller.dart';
import 'pagamento_page.dart';
import 'repositories/interfaces/pagamento_repository_interface.dart';
import 'repositories/pagamento_repository.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IPagamentoRepository>(
            (i) => PagamentoRepository(Modular.get<Dio>())),
        Bind<IPedidoRepository>((i) => PedidoRepository(Modular.get<Dio>())),
        Bind((i) => PagamentoController()),
        Bind((i) => DadosCartaoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pagamento', child: (_, args) => PagamentoPage()),
        ModularRouter('/pagamento/confirmacao',
            child: (_, args) => ConfirmacaoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
