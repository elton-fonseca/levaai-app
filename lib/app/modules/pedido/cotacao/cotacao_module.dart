import 'package:flutter_modular/flutter_modular.dart';

import 'cotacao_controller.dart';
import 'cotacao_page.dart';

class CotacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CotacaoController(), singleton: true),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/cotacao/:id/:acao',
            child: (_, args) => CotacaoPage(
                id: int.parse(args.params['id']), acao: args.params['acao'])),
      ];

  static Inject get to => Inject<CotacaoModule>.of();
}
