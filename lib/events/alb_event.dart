import 'dart:io';

import 'package:aws_lambda_dart_runtime/runtime/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alb_event.g.dart';

/// Event send by an Application Load Balancer to the
/// invocation to the Lambda.
@JsonSerializable()
class AwsALBEvent extends Event {
  /// Request context in which this request is executed.
  /// For the ELB this is the ARN of the target group.
  @JsonKey()
  final AwsALBEventContext? context;

  /// HTTP method that is used to trigger the invocation of the Lambda.
  @JsonKey()
  final String? httpMethod;

  /// The URI that is accessed to trigger the invocation of the Lambda.
  @JsonKey()
  final String? path;

  /// HTTP headers that are send with the request to the load balancer.
  @JsonKey()
  final Map<String, dynamic>? headers;

  /// The query parameters for the request to the load balancer.
  @JsonKey()
  final Map<String, dynamic>? queryStringParameters;

  /// Body of the request. This can be data that is send with the POST
  /// to the request.
  @JsonKey()
  final String? body;

  /// Singals that the request is Base64 encoded.
  @JsonKey()
  final bool? isBase64Encoded;

  factory AwsALBEvent.fromJson(Map<String, dynamic> json) =>
      _$AwsALBEventFromJson(json);

  Map<String, dynamic> toJson() => _$AwsALBEventToJson(this);

  const AwsALBEvent({
    this.context,
    this.httpMethod,
    this.path,
    this.headers,
    this.queryStringParameters,
    this.body,
    this.isBase64Encoded,
  });
}

/// Response for a request from an Application Load Balancer.
/// It has to have a [statusCode], [headers] and a [body].
/// They should reflect the informationen needed here.
class AwsALBResponse {
  /// The body of the HTTP Response send from the API Gateway to the client.
  String? body;

  /// Indicates if the [body] is Base64 encoded or not. By default is `false`.
  bool? isBase64Encoded;

  /// HTTP status code of the response of the API Gateway to the client.
  /// The default status code is `200 OK`.
  int? statusCode;

  /// Description of the send HTTP status code.
  String? statusDescription;

  /// The HTTP headers that should be send with the response to the client.
  Map<String, String>? headers;

  /// Returns the JSON representation of the response. This is called by
  /// the JSON encoder to produce the response.
  Map<String, dynamic> toJson() => {
        'body': body,
        'isBase64Encoded': isBase64Encoded,
        'statusCode': statusCode,
        'statusDescription': statusDescription,
        'headers': headers
      };

  factory AwsALBResponse.fromString(
    String body, {
    bool? isBase64Encoded,
    int? statusCode,
    String? statusDescription,
    Map<String, String>? headers,
  }) {
    return AwsALBResponse(
        body: body,
        headers: headers,
        isBase64Encoded: isBase64Encoded,
        statusCode: statusCode,
        statusDescription: statusDescription);
  }

  /// The Response that should be returned to the Application Load Balancer.
  /// It is constructed with some default values for the optional parameters.
  AwsALBResponse({
    String? body,
    Map<String, String>? headers,
    bool? isBase64Encoded,
    int? statusCode,
    String? statusDescription,
  }) {
    this.body = body ?? '';
    this.isBase64Encoded = isBase64Encoded ?? false;
    this.headers = headers ?? {'Content-Type': 'text/html; charset=utf-8'};
    this.statusCode = statusCode ?? HttpStatus.ok;
    this.statusDescription = statusDescription ?? '200 OK';
  }
}

/// AWS ALB Event Request Context ...
@JsonSerializable()
class AwsALBEventContext {
  factory AwsALBEventContext.fromJson(Map<String, dynamic> json) =>
      _$AwsALBEventContextFromJson(json);

  Map<String, dynamic> toJson() => _$AwsALBEventContextToJson(this);

  const AwsALBEventContext();
}
