import 'package:flutter/material.dart';

import '../../../core/ui/extensions/size_screen_extension.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../core/ui/widgets/cuidapet_text_form_field.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar usuário'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 162.w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20.h),
              const _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
