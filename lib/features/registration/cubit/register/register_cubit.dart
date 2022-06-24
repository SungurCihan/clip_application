import 'package:bloc/bloc.dart';
import '../../model/register_model/register_model.dart';
import '../../service/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../model/login_response_model/login_response_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final GlobalKey<FormState> formKey;

  final ILoginService loginService;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordRepeatController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  RegisterCubit(
      this.emailController,
      this.passwordController,
      this.firstNameController,
      this.lastNameController,
      this.formKey,
      this.passwordRepeatController,
      {required this.loginService})
      : super(const RegisterState());

  void changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  Future<void> register() async {
    if (passwordController.text == passwordRepeatController.text) {
      emit(state.copyWith(arePasswordsMatch: true));
      changeLoading();
      final data = await loginService.register(generateRequestModel());
      changeLoading();

      if (data is LoginResponseModel && data.errorMessage != null) {
        emit(state.copyWith(responseModel: data));
        emit(state.copyWith(isRegistered: true));
        NavigationManager.instance
            .navigateToPage(path: NavigationCostants.login);
      } else {
        emit(state.copyWith(isRegisterFailed: true));
        emit(state.copyWith(isRegistered: false));
      }
    } else {
      emit(state.copyWith(isRegisterFailed: true));
      emit(state.copyWith(isRegistered: false));
      emit(state.copyWith(arePasswordsMatch: false));
    }
  }

  void resetPasswordMatch() => emit(state.copyWith(arePasswordsMatch: true));

  RegisterModel generateRequestModel() {
    return RegisterModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phoneNumber: '00000000000');
  }
}
