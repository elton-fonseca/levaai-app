import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detalhes_controller.dart';
import 'detalhes_page.dart';
import 'repositories/detalhes_repository.dart';
import 'repositories/interfaces/detalhes_repository_interface.dart';

class DetalhesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IDetalhesRepository>((i) => DetalhesRepository(Dio())),
        Bind((i) => DetalhesController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/rastreamento/detalhes',
            child: (_, args) => DetalhesPage()),
      ];

  static Inject get to => Inject<DetalhesModule>.of();
}
