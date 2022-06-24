import '../cubit/register/register_cubit.dart';
import '../model/error_model/error_model.dart';
import '../service/auth_service.dart';
import '../../../product/utilities/alert/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../core/extensions/context_extension.dart';
import '../../../product/widgets/card/logo.dart';
import '../widgets/button/auth_buttons.dart';
import '../widgets/button/pink_button.dart';
import '../widgets/form/custom_text_form_field.dart';

class SignScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordRepeatController =
      TextEditingController();
  SignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(mailController, passwordController,
          nameController, surnameController, formKey, passwordRepeatController,
          loginService: LoginManager(NetworkManager(
              options: BaseOptions(), errorModel: LoginErrorModel()))),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.arePasswordsMatch == false) {
            Alerts.showAlertDialog(
                context, 'Hata', 'Girdiğiniz şifreler eşleşmiyor.');
            context.read<RegisterCubit>().resetPasswordMatch();
          }

          if (state.isRegisterFailed == true) {
            Alerts.showAlertDialog(
                context, 'Hata', state.responseModel?.errorMessage ?? '');
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: Padding(
            padding: context.paddingHigh * 1.5,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.mediaQuery.viewInsets.bottom > 0
                        ? 0
                        : context.height * 20,
                    child:
                        const Expanded(flex: 2, child: Center(child: Logo())),
                  ),
                  Expanded(
                      flex: 4,
                      child: _textFields(
                          nameController,
                          surnameController,
                          mailController,
                          passwordController,
                          passwordRepeatController)),
                  Expanded(flex: 1, child: _registerButton()),
                  const Expanded(flex: 1, child: AuthButtons()),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  Widget _registerButton() {
    return Center(
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          return PinkButton(
              child: state.isLoading == true
                  ? CircularProgressIndicator(
                      color: context.colorScheme.background,
                    )
                  : Text(
                      'Kayıt Ol',
                      style: context.textTheme.bodyText1,
                    ),
              onTap: () => context.read<RegisterCubit>().register());
        },
      ),
    );
  }

  Widget _textFields(
      TextEditingController nameController,
      TextEditingController surnameController,
      TextEditingController mailController,
      TextEditingController passwordController,
      TextEditingController passwordRepeatController) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: state.isValidate == true
              ? AutovalidateMode.disabled
              : AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextFormField(
                textEditingController: nameController,
                hintText: 'İsim',
              ),
              CustomTextFormField(
                textEditingController: surnameController,
                hintText: 'Soyisim',
              ),
              CustomTextFormField(
                textEditingController: mailController,
                hintText: 'E-mail',
              ),
              CustomTextFormField(
                textEditingController: passwordController,
                hintText: 'Şifre',
                isPassword: true,
              ),
              CustomTextFormField(
                textEditingController: passwordRepeatController,
                hintText: 'Şifre Tekrar',
                isPassword: true,
              )
            ],
          ),
        );
      },
    );
  }
}
