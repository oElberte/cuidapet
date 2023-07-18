import 'package:flutter_modular/flutter_modular.dart';

import 'schedules_controller.dart';
import 'schedules_page.dart';

class SchedulesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<SchedulesController>(
          (i) => SchedulesController(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const SchedulesPage(),
        ),
      ];
}
