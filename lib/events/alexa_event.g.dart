// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alexa_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsAlexaEventHeader _$AwsAlexaEventHeaderFromJson(Map<String, dynamic> json) {
  return AwsAlexaEventHeader(
    namespace: json['namespace'] as String?,
    payloadVersion: json['payloadVersion'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$AwsAlexaEventHeaderToJson(
        AwsAlexaEventHeader instance) =>
    <String, dynamic>{
      'payloadVersion': instance.payloadVersion,
      'namespace': instance.namespace,
      'name': instance.name,
    };

AwsAlexaEvent _$AwsAlexaEventFromJson(Map<String, dynamic> json) {
  return AwsAlexaEvent(
    header: json['header'] == null
        ? null
        : AwsAlexaEventHeader.fromJson(json['header'] as Map<String, dynamic>),
    payload: json['payload'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$AwsAlexaEventToJson(AwsAlexaEvent instance) =>
    <String, dynamic>{
      'header': instance.header,
      'payload': instance.payload,
    };
