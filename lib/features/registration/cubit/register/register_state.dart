part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final bool? isLoading;
  final bool? isRegistered;
  final bool? isRegisterFailed;
  final bool? isValidate;
  final bool? arePasswordsMatch;
  final LoginResponseModel? responseModel;

  const RegisterState(
      {this.isLoading,
      this.isRegistered = false,
      this.responseModel,
      this.isValidate,
      this.arePasswordsMatch = false,
      this.isRegisterFailed = false});

  @override
  List<Object?> get props => [
        isLoading,
        isRegistered,
        responseModel,
        isRegisterFailed,
        isValidate,
        arePasswordsMatch
      ];

  RegisterState copyWith(
      {bool? isLoading,
      bool? isRegistered,
      bool? isRegisterFailed,
      bool? isValidate,
      bool? arePasswordsMatch,
      LoginResponseModel? responseModel}) {
    return RegisterState(
        isLoading: isLoading ?? this.isLoading,
        isRegistered: isRegistered ?? this.isRegistered,
        responseModel: responseModel ?? this.responseModel,
        isRegisterFailed: isRegisterFailed ?? this.isRegisterFailed,
        isValidate: isValidate ?? this.isValidate,
        arePasswordsMatch: arePasswordsMatch ?? this.arePasswordsMatch);
  }
}
