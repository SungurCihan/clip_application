import 'package:flutter/material.dart';

import '../../../../core/constants/app/application_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../product/widgets/ui/shadow_constant.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController textEditingController;
  final Widget? prefixIcon;
  bool? isPassword;

  CustomTextFormField(
      {Key? key,
      this.hintText,
      required this.textEditingController,
      this.isPassword,
      this.prefixIcon})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 80,
      height: context.height * 5,
      decoration: _boxDecoration(),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.isPassword == true ? !_isVisible : _isVisible,
        decoration: _inputDecoration(context),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        boxShadow: [ShadowConstant.boxShadow],
        borderRadius: BorderRadius.circular(ApplicationConstants.radius));
  }

  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    //widget.isPassword = !(widget.isPassword!);
                    _isVisible = !_isVisible;
                  });
                },
                icon: !_isVisible
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ))
            : null,
        hintStyle: TextStyle(color: context.colorScheme.secondary),
        hintText: widget.hintText ?? '',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        labelText: widget.hintText ?? '',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ApplicationConstants.radius),
            borderSide: const BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ApplicationConstants.radius),
            borderSide: BorderSide(color: context.colorScheme.primary)));
  }
}
