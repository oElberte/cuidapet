import 'package:flutter_modular/flutter_modular.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<LoginController>(
          (i) => LoginController(
            userService: i(),
            log: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const LoginPage(),
        ),
      ];
}
