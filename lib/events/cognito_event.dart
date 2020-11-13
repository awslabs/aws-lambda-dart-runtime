import 'package:json_annotation/json_annotation.dart';

part 'cognito_event.g.dart';

@JsonSerializable()
class AwsCognitoEvent {
  @JsonKey()
  final String version;

  @JsonKey()
  final String triggerSource;

  @JsonKey()
  final String region;

  @JsonKey()
  final String userPoolId;

  @JsonKey()
  final String userName;

  @JsonKey()
  final Map<String, String> callerContext;

  @JsonKey()
  final AwsCognitoRequest request;

  @JsonKey()
  final AwsCognitoResponse response;

  const AwsCognitoEvent(
      {this.version,
      this.triggerSource,
      this.region,
      this.userPoolId,
      this.userName,
      this.callerContext,
      this.request,
      this.response});

  factory AwsCognitoEvent.fromJson(Map<String, dynamic> json) =>
      _$AwsCognitoEventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCognitoEventToJson(this);
}

@JsonSerializable()
class AwsCognitoRequest {
  @JsonKey()
  final Map<String, dynamic> userAttributes;

  @JsonKey()
  final Map<String, String> validationData;

  @JsonKey()
  final Map<String, String> clientMetadata;

  @JsonKey()
  final bool newDeviceUsed;

  @JsonKey()
  final AwsGroupConfiguration groupConfiguration;

  @JsonKey()
  final String password;

  @JsonKey()
  final String codeParameter;

  const AwsCognitoRequest(
      {this.userAttributes,
      this.validationData,
      this.clientMetadata,
      this.newDeviceUsed,
      this.codeParameter,
      this.password,
      this.groupConfiguration});

  factory AwsCognitoRequest.fromJson(Map<String, dynamic> json) =>
      _$AwsCognitoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCognitoRequestToJson(this);
}

@JsonSerializable()
class AwsCognitoResponse {
  @JsonKey()
  final bool autoConfirmUser;

  @JsonKey()
  final bool autoVerifyPhone;

  @JsonKey()
  final bool autoVerifyEmail;

  @JsonKey()
  final AwsClaimOverrideDetails claimsOverrideDetails;

  @JsonKey()
  final Map<String, String> userAttributes;

  @JsonKey()
  final String finalUserStatus;

  @JsonKey()
  final String messageAction;

  @JsonKey()
  final List<String> desiredDeliveryMediums;

  @JsonKey()
  final bool forceAliasCreation;

  @JsonKey()
  final String smsMessage;

  @JsonKey()
  final String emailMessage;

  @JsonKey()
  final String emailSubject;

  const AwsCognitoResponse(
      {this.autoConfirmUser,
      this.autoVerifyEmail,
      this.autoVerifyPhone,
      this.claimsOverrideDetails,
      this.userAttributes,
      this.finalUserStatus,
      this.desiredDeliveryMediums,
      this.forceAliasCreation,
      this.messageAction,
      this.smsMessage,
      this.emailMessage,
      this.emailSubject});

  factory AwsCognitoResponse.fromJson(Map<String, dynamic> json) =>
      _$AwsCognitoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AwsCognitoResponseToJson(this);
}

@JsonSerializable()
class AwsGroupConfiguration {
  @JsonKey()
  final List<String> groupsToOverride;

  @JsonKey()
  final List<String> iamRolesToOverride;

  @JsonKey()
  final String preferredRole;

  @JsonKey()
  final Map<String, String> clientMetadata;

  const AwsGroupConfiguration(
      {this.groupsToOverride,
      this.iamRolesToOverride,
      this.preferredRole,
      this.clientMetadata});

  factory AwsGroupConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AwsGroupConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AwsGroupConfigurationToJson(this);
}

@JsonSerializable()
class AwsClaimOverrideDetails {
  @JsonKey()
  final Map<String, String> claimsToAddOrOverride;

  @JsonKey()
  final List<String> claimsToSuppress;

  @JsonKey()
  final AwsGroupConfiguration groupOverrideDetails;

  const AwsClaimOverrideDetails(
      {this.claimsToAddOrOverride,
      this.claimsToSuppress,
      this.groupOverrideDetails});

  factory AwsClaimOverrideDetails.fromJson(Map<String, dynamic> json) =>
      _$AwsClaimOverrideDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AwsClaimOverrideDetailsToJson(this);
}
