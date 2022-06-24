import 'package:vexana/vexana.dart';

import '../model/login_request_model/login_request_model.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/register_model/register_model.dart';

abstract class ILoginService {
  late final INetworkManager _networkManager;

  ILoginService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<INetworkModel?> login(LoginRequestModel loginRequestModel);
  Future<INetworkModel?> register(RegisterModel registerModel);
}

class LoginManager extends ILoginService {
  LoginManager(INetworkManager networkManager) : super(networkManager);

  @override
  Future<INetworkModel?> login(LoginRequestModel loginRequestModel) async {
    try {
      final response =
          await _networkManager.send<LoginResponseModel, LoginResponseModel>(
              'https://10.0.2.2:44332/api/Auth/login',
              parseModel: LoginResponseModel(),
              method: RequestType.POST,
              data: loginRequestModel);

      return response.data is LoginResponseModel ? response.data : null;
    } catch (e) {
      return LoginResponseModel(errorMessage: e.toString());
    }
  }

  @override
  Future<INetworkModel?> register(RegisterModel registerModel) async {
    try {
      final response =
          await _networkManager.send<LoginResponseModel, LoginResponseModel>(
              'https://10.0.2.2:44332/api/Auth/register',
              parseModel: LoginResponseModel(),
              method: RequestType.POST,
              data: registerModel);

      return response.data is LoginResponseModel ? response.data : null;
    } catch (e) {
      return LoginResponseModel(errorMessage: 'Çeşitli Hatalar');
    }
  }
}
