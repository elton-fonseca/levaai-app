import 'package:flutter_modular/flutter_modular.dart';

import 'lista_controller.dart';
import 'lista_page.dart';

class ListaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListaController(), singleton: true),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/lista', child: (_, args) => ListaPage()),
      ];

  static Inject get to => Inject<ListaModule>.of();
}
