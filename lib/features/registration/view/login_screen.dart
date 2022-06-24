import '../cubit/login/login_cubit.dart';
import '../service/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_manager.dart';

import '../../../core/constants/app/application_constants.dart';

import '../../../core/extensions/context_extension.dart';
import '../widgets/button/auth_buttons.dart';
import '../widgets/button/custom_text_button.dart';
import '../widgets/button/pink_button.dart';
import '../widgets/form/custom_text_form_field.dart';
import '../../../product/widgets/card/logo.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          emailController, passwordController, formKey,
          loginService: LoginManager(NetworkManager(
              options: BaseOptions(headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          })))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isLogged == true) {
            // NavigationManager.instance
            //     .navigateToPage(path: NavigationCostants.home);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: context.height * 5),
              child: Column(
                children: [
                  const Expanded(flex: 2, child: Logo()),
                  Expanded(
                      flex: 3,
                      child: _loginForm(
                          emailController, passwordController, context, state)),
                  const Expanded(flex: 1, child: SizedBox()),
                  const Expanded(flex: 1, child: AuthButtons()),
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(flex: 1, child: _bottomDivider(context)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bottomDivider(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: Container(
        alignment: Alignment.bottomCenter,
        height: context.height * 6,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: context.colorScheme.onSurface)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hesabın yok mu?',
              ),
              CustomTextButton(
                text: 'Kaydol',
                fontSize: ApplicationConstants.fontSizeMedium,
                onTap: () {
                  NavigationManager.instance
                      .navigateToPage(path: NavigationCostants.sign);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
    LoginState state,
  ) {
    return Form(
      key: formKey,
      autovalidateMode: state.isValidate == true
          ? AutovalidateMode.disabled
          : AutovalidateMode.always,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextFormField(
            textEditingController: emailController,
            hintText: 'E-posta',
            prefixIcon: const Icon(IconlyLight.profile),
          ),
          CustomTextFormField(
            textEditingController: passwordController,
            hintText: 'Şifre',
            prefixIcon: const Icon(IconlyLight.lock),
            isPassword: true,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: context.width * 10),
              child: CustomTextButton(
                text: 'Şifreni mi unuttun?',
                color: context.colorScheme.surface,
                fontSize: ApplicationConstants.fontSizeLow,
              ),
            ),
          ),
          Center(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return PinkButton(
                  child: state.isLoading == true
                      ? CircularProgressIndicator(
                          color: context.colorScheme.background,
                        )
                      : Text(
                          'Giriş Yap',
                          style: context.textTheme.bodyText1,
                        ),
                  onTap: () {
                    context.read<LoginCubit>().login();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
