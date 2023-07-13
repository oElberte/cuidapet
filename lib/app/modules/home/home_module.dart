import 'package:flutter_modular/flutter_modular.dart';

import '../core/supplier/supplier_core_module.dart';
import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => HomeController(
            addressService: i(),
            supplierService: i(),
          ),
        ),
      ];

  @override
  List<Module> get imports => [
        SupplierCoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const HomePage(),
        ),
      ];
}
