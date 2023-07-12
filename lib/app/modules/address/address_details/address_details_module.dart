import 'package:flutter_modular/flutter_modular.dart';

import 'address_details_controller.dart';
import 'address_details_page.dart';

class AddressDetailsModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<AddressDetailsController>(
          (i) => AddressDetailsController(
            addressService: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => AddressDetailsPage(
            place: args.data,
          ),
        ),
      ];
}
