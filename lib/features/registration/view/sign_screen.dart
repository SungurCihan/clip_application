import '../widgets/button/auth_buttons.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/image/image_constants.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../product/widgets/card/logo.dart';
import '../widgets/button/pink_button.dart';
import '../widgets/form/custom_text_form_field.dart';
import '../widgets/form/google_auth_card.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordRepeatController = TextEditingController();

    return Scaffold(
        body: Padding(
      padding: context.paddingHigh * 3,
      child: Center(
        child: Column(
          children: [
            const Expanded(flex: 2, child: Logo()),
            Expanded(
                flex: 4,
                child: _textFields(
                    nameController,
                    surnameController,
                    mailController,
                    passwordController,
                    passwordRepeatController)),
            const Expanded(
                flex: 1,
                child: Center(
                  child: PinkButton(
                    text: 'Kayıt Ol',
                  ),
                )),
            const Expanded(flex: 1, child: AuthButtons()),
          ],
        ),
      ),
    ));
  }

  Widget _textFields(
      TextEditingController nameController,
      TextEditingController surnameController,
      TextEditingController mailController,
      TextEditingController passwordController,
      TextEditingController passwordRepeatController) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
