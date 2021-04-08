// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alb_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsALBEvent _$AwsALBEventFromJson(Map<String, dynamic> json) {
  return AwsALBEvent(
    context: json['context'] == null
        ? null
        : AwsALBEventContext.fromJson(json['context'] as Map<String, dynamic>),
    httpMethod: json['httpMethod'] as String?,
    path: json['path'] as String?,
    headers: json['headers'] as Map<String, dynamic>?,
    queryStringParameters:
        json['queryStringParameters'] as Map<String, dynamic>?,
    body: json['body'] as String?,
    isBase64Encoded: json['isBase64Encoded'] as bool?,
  );
}

Map<String, dynamic> _$AwsALBEventToJson(AwsALBEvent instance) =>
    <String, dynamic>{
      'context': instance.context,
      'httpMethod': instance.httpMethod,
      'path': instance.path,
      'headers': instance.headers,
      'queryStringParameters': instance.queryStringParameters,
      'body': instance.body,
      'isBase64Encoded': instance.isBase64Encoded,
    };

AwsALBEventContext _$AwsALBEventContextFromJson(Map<String, dynamic> json) {
  return AwsALBEventContext();
}

Map<String, dynamic> _$AwsALBEventContextToJson(AwsALBEventContext instance) =>
    <String, dynamic>{};
