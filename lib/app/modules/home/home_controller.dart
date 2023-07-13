import 'package:mobx/mobx.dart';

import '../../core/life_cycle/controller_life_cycle.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  @override
  Future<void> onReady() async {
    await _hasRegisteredAddress(); 
  }
  
  Future<void> _hasRegisteredAddress() async {
    
  }
}
