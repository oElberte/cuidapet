import 'package:flutter_modular/flutter_modular.dart';

import 'address_page.dart';

class AddressModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const AddressPage(),
        )
      ];
}
