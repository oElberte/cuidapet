part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    loginEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: loginEC,
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Senha',
            obscureText: true,
            controller: passwordEC,
          ),
          SizedBox(height: 20.h),
          CuidapetDefaultButton(
            label: 'Entrar',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
