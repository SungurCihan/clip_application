// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginErrorModel _$LoginErrorModelFromJson(Map<String, dynamic> json) =>
    LoginErrorModel(
      errors: json['errors'] as List<dynamic>?,
      message: json['message'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$LoginErrorModelToJson(LoginErrorModel instance) =>
    <String, dynamic>{
      'errors': instance.errors,
      'message': instance.message,
      'statusCode': instance.statusCode,
    };
