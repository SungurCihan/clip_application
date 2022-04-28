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
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: context.height * 5),
        child: Column(
          children: [
            const Expanded(flex: 2, child: Logo()),
            Expanded(
                flex: 3,
                child:
                    _loginForm(emailController, passwordController, context)),
            const Expanded(flex: 1, child: SizedBox()),
            const Expanded(flex: 1, child: AuthButtons()),
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(flex: 1, child: _bottomDivider(context)),
          ],
        ),
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomTextFormField(
            textEditingController: emailController,
            hintText: 'E-posta',
            prefixIcon: const Icon(IconlyLight.profile)),
        CustomTextFormField(
          textEditingController: passwordController,
          hintText: 'Şifre',
          prefixIcon: const Icon(IconlyLight.lock),
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
          child: PinkButton(
            text: 'Giriş Yap',
            onTap: () {
              NavigationManager.instance
                  .navigateToPage(path: NavigationCostants.home);
            },
          ),
        )
      ],
    );
  }
}
