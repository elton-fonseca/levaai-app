import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/stores/pedido_lista_store.dart';

import 'cotacao_controller.dart';
import 'cotacao_page.dart';
import 'repositories/cotacao_repository.dart';
import 'repositories/interfaces/cotacao_repository_interface.dart';

class CotacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<ICotacaoRepository>((i) {
          return CotacaoRepository(Modular.get<Dio>());
        }),
        Bind((i) => CotacaoController(Modular.get<PedidoListaStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/cotacao/:id/:acao',
            child: (_, args) => CotacaoPage(
                id: int.parse(args.params['id']), acao: args.params['acao'])),
      ];

  static Inject get to => Inject<CotacaoModule>.of();
}
