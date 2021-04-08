// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apigateway_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AwsApiGatewayEvent _$AwsApiGatewayEventFromJson(Map<String, dynamic> json) {
  return AwsApiGatewayEvent(
    resource: json['resource'] as String?,
    path: json['path'] as String?,
    httpMethod: json['httpMethod'] as String?,
    body: json['body'] as String?,
    headers: json['headers'] == null
        ? null
        : AwsApiGatewayEventHeaders.fromJson(
            json['headers'] as Map<String, dynamic>),
    queryStringParameters:
        json['queryStringParameters'] as Map<String, dynamic>?,
    stageVariables: json['stageVariables'] as Map<String, dynamic>?,
    requestContext: json['requestContext'] == null
        ? null
        : AwsApiGatewayEventRequestContext.fromJson(
            json['requestContext'] as Map<String, dynamic>),
    pathParameters: json['pathParameters'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$AwsApiGatewayEventToJson(AwsApiGatewayEvent instance) =>
    <String, dynamic>{
      'path': instance.path,
      'resource': instance.resource,
      'httpMethod': instance.httpMethod,
      'body': instance.body,
      'headers': instance.headers,
      'pathParameters': instance.pathParameters,
      'queryStringParameters': instance.queryStringParameters,
      'stageVariables': instance.stageVariables,
      'requestContext': instance.requestContext,
    };

AwsApiGatewayEventHeaders _$AwsApiGatewayEventHeadersFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayEventHeaders(
    accept: json['Accept'] as String?,
    acceptEncoding: json['Accept-Encoding'] as String?,
    cloudfrontIsDesktopViewer: json['CloudFront-Is-Desktop-Viewer'] as String?,
    cloudfrontIsMobileViewer: json['CloudFront-Is-Mobile-Viewer'] as String?,
    cloudfrontIsSmartTvViewer: json['CloudFront-Is-SmartTV-Viewer'] as String?,
    cloudfrontForwardProto: json['CloudFront-Forwarded-Proto'] as String?,
    cloudfrontIsTabletViewer: json['CloudFront-Is-Tablet-Viewer'] as String?,
    cloudfrontViewerCountry: json['CloudFront-Viewer-Country'] as String?,
    upgradeInsecureRequests: json['Upgrade-Insecure-Requests'] as String?,
    cacheControl: json['Cache-Control'] as String?,
    host: json['Host'] as String?,
    via: json['Via'] as String?,
    userAgent: json['User-Agent'] as String?,
    xAmzCfId: json['X-Amz-Cf-Id'] as String?,
    xAmznTraceId: json['X-Amzn-Trace-Id'] as String?,
    xForwardedFor: json['X-Forwarded-For'] as String?,
    xForwardedPort: json['X-Forwarded-Port'] as String?,
    xForwardedProto: json['X-Forwarded-Proto'] as String?,
  );
}

Map<String, dynamic> _$AwsApiGatewayEventHeadersToJson(
        AwsApiGatewayEventHeaders instance) =>
    <String, dynamic>{
      'Accept': instance.accept,
      'Accept-Encoding': instance.acceptEncoding,
      'CloudFront-Forwarded-Proto': instance.cloudfrontForwardProto,
      'CloudFront-Is-Desktop-Viewer': instance.cloudfrontIsDesktopViewer,
      'CloudFront-Is-Mobile-Viewer': instance.cloudfrontIsMobileViewer,
      'CloudFront-Is-SmartTV-Viewer': instance.cloudfrontIsSmartTvViewer,
      'CloudFront-Is-Tablet-Viewer': instance.cloudfrontIsTabletViewer,
      'CloudFront-Viewer-Country': instance.cloudfrontViewerCountry,
      'Host': instance.host,
      'Upgrade-Insecure-Requests': instance.upgradeInsecureRequests,
      'User-Agent': instance.userAgent,
      'Via': instance.via,
      'X-Amz-Cf-Id': instance.xAmzCfId,
      'X-Forwarded-For': instance.xForwardedFor,
      'X-Forwarded-Port': instance.xForwardedPort,
      'X-Forwarded-Proto': instance.xForwardedProto,
      'Cache-Control': instance.cacheControl,
      'X-Amzn-Trace-Id': instance.xAmznTraceId,
    };

AwsApiGatewayEventRequestContext _$AwsApiGatewayEventRequestContextFromJson(
    Map<String, dynamic> json) {
  return AwsApiGatewayEventRequestContext(
    accountId: json['accountId'] as String?,
    resourceId: json['resourceId'] as String?,
    stage: json['stage'] as String?,
    requestId: json['requestId'] as String?,
    resourcePath: json['resourcePath'] as String?,
    httpMethod: json['httpMethod'] as String?,
    apiId: json['apiId'] as String?,
  );
}

Map<String, dynamic> _$AwsApiGatewayEventRequestContextToJson(
        AwsApiGatewayEventRequestContext instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'resourceId': instance.resourceId,
      'stage': instance.stage,
      'requestId': instance.requestId,
      'resourcePath': instance.resourcePath,
      'httpMethod': instance.httpMethod,
      'apiId': instance.apiId,
    };

AwsApiGatewayEventRequestContextIdentity
    _$AwsApiGatewayEventRequestContextIdentityFromJson(
        Map<String, dynamic> json) {
  return AwsApiGatewayEventRequestContextIdentity(
    cognitoIdentityPoolId: json['cognitoIdentityPoolId'] as String?,
    cognitoAuthenticationProvider:
        json['cognitoAuthenticationProvider'] as String?,
    cognitoAuthenticationType: json['cognitoAuthenticationType'] as String?,
    caller: json['caller'] as String?,
    accountId: json['accountId'] as String?,
    cognitoIdentityId: json['cognitoIdentityId'] as String?,
    apiKey: json['apiKey'] as String?,
    sourceIp: json['sourceIp'] as String?,
    user: json['user'] as String?,
    userAgent: json['userAgent'] as String?,
    userArn: json['userArn'] as String?,
  );
}

Map<String, dynamic> _$AwsApiGatewayEventRequestContextIdentityToJson(
        AwsApiGatewayEventRequestContextIdentity instance) =>
    <String, dynamic>{
      'cognitoIdentityPoolId': instance.cognitoIdentityPoolId,
      'accountId': instance.accountId,
      'cognitoIdentityId': instance.cognitoIdentityId,
      'caller': instance.caller,
      'apiKey': instance.apiKey,
      'sourceIp': instance.sourceIp,
      'cognitoAuthenticationType': instance.cognitoAuthenticationType,
      'cognitoAuthenticationProvider': instance.cognitoAuthenticationProvider,
      'userArn': instance.userArn,
      'userAgent': instance.userAgent,
      'user': instance.user,
    };
