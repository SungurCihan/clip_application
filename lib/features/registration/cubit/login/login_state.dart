part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool? isLoginFailed;
  final bool? isLoading;
  final bool? isValidate;
  final bool? isLogged;
  final LoginResponseModel? responseModel;

  const LoginState(
      {this.isLoading,
      this.responseModel,
      this.isLoginFailed,
      this.isValidate,
      this.isLogged = false});

  @override
  List<Object?> get props =>
      [isLoading, responseModel, isLoginFailed, isValidate, isLogged];

  LoginState copyWith({
    bool? isLoading,
    bool? isLoginFailed,
    bool? isValidate,
    bool? isLogged,
    LoginResponseModel? responseModel,
  }) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        responseModel: responseModel ?? this.responseModel,
        isLoginFailed: isLoginFailed ?? this.isLoginFailed,
        isValidate: isValidate ?? this.isValidate,
        isLogged: isLogged ?? this.isLogged);
  }
}
