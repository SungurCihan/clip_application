import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends INetworkModel<RegisterModel> with EquatableMixin {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  RegisterModel(
      {this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.phoneNumber});

  @override
  RegisterModel fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  List<Object?> get props =>
      [email, password, firstName, lastName, phoneNumber];

  @override
  Map<String, dynamic>? toJson() {
    return _$RegisterModelToJson(this);
  }
}
