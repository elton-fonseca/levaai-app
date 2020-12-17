import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../repositories/interfaces/rastreamento_repository_interface.dart';
import '../repositories/rastreamento_repository.dart';

import 'detalhes_controller.dart';
import 'detalhes_page.dart';

class DetalhesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRastreamentoRepository>(
            (i) => RastreamentoRepository(Modular.get<Dio>())),
        Bind((i) => DetalhesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/rastreamento/detalhes/:id',
            child: (_, args) => DetalhesPage(id: int.parse(args.params['id']))),
      ];

  static Inject get to => Inject<DetalhesModule>.of();
}
