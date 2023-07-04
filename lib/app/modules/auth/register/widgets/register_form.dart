part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final formKey = GlobalKey<FormState>();
  final loginEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CuidapetTextFormField(
            label: 'Login',
            controller: loginEC,
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Senha',
            controller: passwordEC,
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          CuidapetTextFormField(
            label: 'Confirmar senha',
            obscureText: true,
          ),
          SizedBox(height: 20.h),
          CuidapetDefaultButton(
            label: 'Cadastrar',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
