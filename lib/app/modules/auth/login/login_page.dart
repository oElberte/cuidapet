import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/extensions/theme_extension.dart';
import '../../../core/ui/icons/cuidapet_icons.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../core/ui/widgets/cuidapet_text_form_field.dart';
import '../../../core/ui/widgets/rounded_button_with_icon.dart';
import 'login_controller.dart';

part 'widgets/login_form.dart';
part 'widgets/login_register_buttons.dart';
part 'widgets/or_separator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20.h),
              const _LoginForm(),
              SizedBox(height: 8.h),
              const _OrSeparator(),
              SizedBox(height: 8.h),
              const _LoginRegisterButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
