import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/repositories/interfaces/monitoramento_repository_interface.dart';
import '../../../core/repositories/monitoramento_repository.dart';
import '../../../core/stores/pedido_lista_store.dart';
import 'formulario_controller.dart';
import 'formulario_page.dart';
import 'repositories/formulario_repository.dart';
import 'repositories/interfaces/formulario_repository_interface.dart';
import 'widgets/detalhes/detalhes_controller.dart';
import 'widgets/endereco/endereco_controller.dart';
import 'widgets/popup/popup_controller.dart';
import 'widgets/tipo_medida/tipo_medida_controller.dart';

class FormularioModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormularioController(), singleton: true),
        Bind((i) => PopupController(Modular.get<PedidoListaStore>())),
        Bind((i) => TipoMedidaController(Modular.get<PedidoListaStore>())),
        Bind((i) => EnderecoController(Modular.get<PedidoListaStore>())),
        Bind((i) => DetalhesController()),
        Bind<IFormularioRepository>((i) {
          return FormularioRepository(Modular.get<Dio>());
        }),
        Bind<IMonitoramentoRepository>((i) {
          return MonitoramentoRepository(Modular.get<Dio>());
        }),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/pedido/formulario/:id/:acao',
            child: (_, args) => FormularioPage(
                id: int.parse(args.params['id']), acao: args.params['acao'])),
      ];

  static Inject get to => Inject<FormularioModule>.of();
}
