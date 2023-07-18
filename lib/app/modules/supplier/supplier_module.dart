import 'package:flutter_modular/flutter_modular.dart';

import '../core/supplier/supplier_core_module.dart';
import 'supplier_controller.dart';
import 'supplier_page.dart';

class SupplierModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<SupplierController>(
          (i) => SupplierController(
            supplierService: i(),
            log: i(),
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
          '/',
          child: (context, args) => SupplierPage(
            supplierId: args.data,
          ),
        ),
      ];
}
