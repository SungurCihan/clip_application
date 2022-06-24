import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'error_model.g.dart';

@JsonSerializable()
class LoginErrorModel extends INetworkModel<LoginErrorModel> {
  List? errors;
  String? message;
  int? statusCode;

  LoginErrorModel({this.errors, this.message, this.statusCode});

  @override
  Map<String, dynamic>? toJson() {
    return _$LoginErrorModelToJson(this);
  }

  @override
  LoginErrorModel fromJson(Map<String, dynamic> json) {
    return _$LoginErrorModelFromJson(json);
  }
}
