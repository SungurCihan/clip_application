import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends INetworkModel<LoginResponseModel>
    with EquatableMixin {
  final String? token;
  final String? expiration;
  final String? errorMessage;

  LoginResponseModel({
    this.errorMessage,
    this.token,
    this.expiration,
  });

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  List<Object?> get props => [token, expiration, errorMessage];

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
