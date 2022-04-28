import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_manager.dart';

import '../../../core/extensions/context_extension.dart';
import '../widgets/button/custom_text_button.dart';
import '../widgets/button/pink_button.dart';
import '../../../product/widgets/card/logo.dart';
import 'package:flutter/material.dart';

class LoginOrSign extends StatelessWidget {
  const LoginOrSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.height * 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 4, child: Logo()),
              const Expanded(flex: 1, child: SizedBox()), //Space
              Expanded(flex: 2, child: _buttons()),
              const Expanded(flex: 2, child: SizedBox()) //Space
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PinkButton(
          text: 'Kayıt Ol',
          onTap: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationCostants.sign);
          },
        ),
        CustomTextButton(
          text: 'Giriş Yap',
          onTap: () {
            NavigationManager.instance
                .navigateToPage(path: NavigationCostants.login);
          },
        ),
      ],
    );
  }
}
