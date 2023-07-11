import 'package:mobx/mobx.dart';

import '../../../core/exceptions/user_exists_exception.dart';
import '../../../core/logger/app_logger.dart';
import '../../../core/ui/widgets/loader.dart';
import '../../../core/ui/widgets/messages.dart';
import '../../../services/user/user_service.dart';

part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final AppLogger _log;

  RegisterControllerBase({
    required UserService userService,
    required AppLogger log,
  })  : _userService = userService,
        _log = log;

  Future<void> register({required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Messages.info('Conta criada com sucesso! Por favor confirme seu email.');
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert('Email já utilizado, por favor escolha outro');
    } catch (e, s) {
      const errorMessage = 'Erro ao registrar usuário';
      _log.error(errorMessage, e, s);
      Loader.hide();
      Messages.alert(errorMessage);
    }
  }
}
