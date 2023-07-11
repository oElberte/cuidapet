part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
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
    final controller = Modular.get<RegisterController>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: _loginEC,
            validator: Validatorless.multiple([
              Validatorless.required('Login obrigatório'),
              Validatorless.email('Email inválido'),
            ]),
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Senha',
            controller: _passwordEC,
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(6, 'Senha precisa ter pelo menos 6 caracteres'),
            ]),
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Confirmar senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Confirmação de senha obrigatória'),
              Validatorless.min(6, 'Confirmação de senha precisa ter pelo menos 6 caracteres'),
              Validatorless.compare(_passwordEC, 'As senhas não conferem'),
            ]),
          ),
          SizedBox(height: 20.h),
          CuidapetDefaultButton(
            label: 'Cadastrar',
            onPressed: () async {
              final isValid = _formKey.currentState?.validate() ?? false;

              if (isValid) {
                await controller.register(email: _loginEC.text, password: _passwordEC.text);
                if (mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
