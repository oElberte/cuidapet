import 'package:flutter_modular/flutter_modular.dart';

import 'address_details/address_details_module.dart';
import 'address_page.dart';
import 'widgets/address_search_widget/address_search_controller.dart';

class AddressModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AddressSearchController>(
          (i) => AddressSearchController(
            addressService: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const AddressPage(),
        ),
        ModuleRoute(
          '/details/',
          module: AddressDetailsModule(),
        ),
      ];
}
