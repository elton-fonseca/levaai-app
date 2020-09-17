import 'package:flutter_modular/flutter_modular.dart';

import 'formulario_controller.dart';
import 'formulario_page.dart';
import 'widgets/popup/popup_controller.dart';

class FormularioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormularioController(), singleton: true),
        Bind((i) => PopupController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/formulario/:id/:acao',
            child: (_, args) => FormularioPage(
                id: int.parse(args.params['id']), acao: args.params['acao'])),
      ];

  static Inject get to => Inject<FormularioModule>.of();
}
