import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/interfaces/rastreamento_repository_interface.dart';
import '../repositories/rastreamento_repository.dart';
import 'lista_controller.dart';
import 'lista_page.dart';

class ListaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind<IRastreamentoRepository>(
            (i) => RastreamentoRepository(Modular.get<Dio>())),
        Bind((i) => ListaController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/rastreamento/lista', child: (_, args) => ListaPage()),
      ];

  static Inject get to => Inject<ListaModule>.of();
}
