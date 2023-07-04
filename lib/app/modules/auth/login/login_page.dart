import 'package:flutter/material.dart';

import '../../../core/ui/widgets/cuidapet_text_form_field.dart';

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
          ],
        ),
      ),
    );
  }
}
