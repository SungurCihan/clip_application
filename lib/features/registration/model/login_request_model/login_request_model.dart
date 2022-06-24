import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends INetworkModel<LoginRequestModel>
    with EquatableMixin {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginRequestModelToJson(this);
  }

  @override
  List<Object?> get props => [email, password];
}
