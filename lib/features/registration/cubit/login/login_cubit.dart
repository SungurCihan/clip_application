import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/navigation/navigation_manager.dart';
import '../../model/login_request_model/login_request_model.dart';
import '../../model/login_response_model/login_response_model.dart';
import '../../service/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  final ILoginService loginService;

  LoginCubit(this.emailController, this.passwordController, this.formKey,
      {required this.loginService})
      : super(const LoginState());

  void resetLogin() {
    emit(state.copyWith(isLogged: false));
  }

  Future<void> login() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoading();
      final data = await loginService.login(generateRequestModel());
      changeLoading();

      if (data is LoginResponseModel) {
        emit(state.copyWith(responseModel: data));
        emit(state.copyWith(isLogged: true));
        NavigationManager.instance
            .navigateToPage(path: NavigationCostants.home);
      }
    } else {
      emit(state.copyWith(isLoginFailed: true));
      emit(state.copyWith(isValidate: false));
      emit(state.copyWith(isLogged: false));
    }
  }

  void changeLoading() {
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }

  LoginRequestModel generateRequestModel() {
    return LoginRequestModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
