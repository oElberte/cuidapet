import 'package:flutter/material.dart';

import '../../../core/ui/icons/cuidapet_icons.dart';
import '../../../core/ui/widgets/cuidapet_default_button.dart';
import '../../../core/ui/widgets/cuidapet_text_form_field.dart';
import '../../../core/ui/widgets/rounded_button_with_icon.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginEC = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CuidapetTextFormField(
              label: 'Login',
              controller: loginEC,
            ),
            CuidapetTextFormField(
              label: 'Senha',
              obscureText: true,
            ),
            CuidapetDefaultButton(
              onPressed: () {},
              label: 'Teste',
            ),
            RoundedButtonWithIcon(
              onTap: () {},
              width: 200,
              color: Colors.blue,
              label: 'Facebook',
              icon: CuidapetIcons.facebook,
            ),
            RoundedButtonWithIcon(
              onTap: () {},
              width: 200,
              color: Colors.orange[800]!,
              label: 'Google',
              icon: CuidapetIcons.google,
            ),
          ],
        ),
      ),
    );
  }
}
