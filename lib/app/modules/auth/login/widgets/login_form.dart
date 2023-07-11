part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Email obrigatório'),
              Validatorless.email('Email inválido'),
            ]),
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: _passwordEC,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Senha deve conter pelo menos 6 caracteres'),
            ]),
          ),
          SizedBox(height: 20.h),
          CuidapetDefaultButton(
            label: 'Entrar',
            onPressed: () async {
              final isValid = _formKey.currentState?.validate() ?? false;

              if (isValid) {
                await controller.login(_loginEC.text, _passwordEC.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
