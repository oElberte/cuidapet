import 'package:cuidapet_mobile/app/modules/auth/auth_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/auth/',
          module: AuthModule(),
        ),
      ];
}
