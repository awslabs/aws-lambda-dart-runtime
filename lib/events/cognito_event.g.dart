// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cognito_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsCognitoEvent _$AwsCognitoEventFromJson(Map<String, dynamic> json) {
  return AwsCognitoEvent(
    version: json['version'] as String,
    triggerSource: json['triggerSource'] as String,
    region: json['region'] as String,
    userPoolId: json['userPoolId'] as String,
    userName: json['userName'] as String,
    callerContext: (json['callerContext'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    request: json['request'] == null
        ? null
        : AwsCognitoRequest.fromJson(json['request'] as Map<String, dynamic>),
    response: json['response'] == null
        ? null
        : AwsCognitoResponse.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCognitoEventToJson(AwsCognitoEvent instance) =>
    <String, dynamic>{
      'version': instance.version,
      'triggerSource': instance.triggerSource,
      'region': instance.region,
      'userPoolId': instance.userPoolId,
      'userName': instance.userName,
      'callerContext': instance.callerContext,
      'request': instance.request,
      'response': instance.response,
    };

AwsCognitoRequest _$AwsCognitoRequestFromJson(Map<String, dynamic> json) {
  return AwsCognitoRequest(
    userAttributes: json['userAttributes'] as Map<String, dynamic>,
    validationData: (json['validationData'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    clientMetadata: (json['clientMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    newDeviceUsed: json['newDeviceUsed'] as bool,
    codeParameter: json['codeParameter'] as String,
    password: json['password'] as String,
    groupConfiguration: json['groupConfiguration'] == null
        ? null
        : AwsGroupConfiguration.fromJson(
            json['groupConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsCognitoRequestToJson(AwsCognitoRequest instance) =>
    <String, dynamic>{
      'userAttributes': instance.userAttributes,
      'validationData': instance.validationData,
      'clientMetadata': instance.clientMetadata,
      'newDeviceUsed': instance.newDeviceUsed,
      'groupConfiguration': instance.groupConfiguration,
      'password': instance.password,
      'codeParameter': instance.codeParameter,
    };

AwsCognitoResponse _$AwsCognitoResponseFromJson(Map<String, dynamic> json) {
  return AwsCognitoResponse(
    autoConfirmUser: json['autoConfirmUser'] as bool,
    autoVerifyEmail: json['autoVerifyEmail'] as bool,
    autoVerifyPhone: json['autoVerifyPhone'] as bool,
    claimsOverrideDetails: json['claimsOverrideDetails'] == null
        ? null
        : AwsClaimOverrideDetails.fromJson(
            json['claimsOverrideDetails'] as Map<String, dynamic>),
    userAttributes: (json['userAttributes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    finalUserStatus: json['finalUserStatus'] as String,
    desiredDeliveryMediums: (json['desiredDeliveryMediums'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    forceAliasCreation: json['forceAliasCreation'] as bool,
    messageAction: json['messageAction'] as String,
    smsMessage: json['smsMessage'] as String,
    emailMessage: json['emailMessage'] as String,
    emailSubject: json['emailSubject'] as String,
  );
}

Map<String, dynamic> _$AwsCognitoResponseToJson(AwsCognitoResponse instance) =>
    <String, dynamic>{
      'autoConfirmUser': instance.autoConfirmUser,
      'autoVerifyPhone': instance.autoVerifyPhone,
      'autoVerifyEmail': instance.autoVerifyEmail,
      'claimsOverrideDetails': instance.claimsOverrideDetails,
      'userAttributes': instance.userAttributes,
      'finalUserStatus': instance.finalUserStatus,
      'messageAction': instance.messageAction,
      'desiredDeliveryMediums': instance.desiredDeliveryMediums,
      'forceAliasCreation': instance.forceAliasCreation,
      'smsMessage': instance.smsMessage,
      'emailMessage': instance.emailMessage,
      'emailSubject': instance.emailSubject,
    };

AwsGroupConfiguration _$AwsGroupConfigurationFromJson(
    Map<String, dynamic> json) {
  return AwsGroupConfiguration(
    groupsToOverride:
        (json['groupsToOverride'] as List)?.map((e) => e as String)?.toList(),
    iamRolesToOverride:
        (json['iamRolesToOverride'] as List)?.map((e) => e as String)?.toList(),
    preferredRole: json['preferredRole'] as String,
    clientMetadata: (json['clientMetadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$AwsGroupConfigurationToJson(
        AwsGroupConfiguration instance) =>
    <String, dynamic>{
      'groupsToOverride': instance.groupsToOverride,
      'iamRolesToOverride': instance.iamRolesToOverride,
      'preferredRole': instance.preferredRole,
      'clientMetadata': instance.clientMetadata,
    };

AwsClaimOverrideDetails _$AwsClaimOverrideDetailsFromJson(
    Map<String, dynamic> json) {
  return AwsClaimOverrideDetails(
    claimsToAddOrOverride:
        (json['claimsToAddOrOverride'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    claimsToSuppress:
        (json['claimsToSuppress'] as List)?.map((e) => e as String)?.toList(),
    groupOverrideDetails: json['groupOverrideDetails'] == null
        ? null
        : AwsGroupConfiguration.fromJson(
            json['groupOverrideDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AwsClaimOverrideDetailsToJson(
        AwsClaimOverrideDetails instance) =>
    <String, dynamic>{
      'claimsToAddOrOverride': instance.claimsToAddOrOverride,
      'claimsToSuppress': instance.claimsToSuppress,
      'groupOverrideDetails': instance.groupOverrideDetails,
    };
