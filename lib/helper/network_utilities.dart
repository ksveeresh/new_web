import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart'; // Import this for MediaType

class NetworkUtil {
  static final NetworkUtil _instance = NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = const JsonDecoder();

  Future<dynamic> get(String url, {Map<String, String>? headers}) {
    final client = InterceptedClient.build(
      interceptors: [CustomInterceptor()],
      retryPolicy: MyRetryPolicy(),
    );

    return client
        .get(Uri.parse(url), headers: headers)
        .then((response) {
          final String res = response.body;
          if (response.statusCode == 200) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 404) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 401) {
            client.close();
            return _decoder.convert(res);
          } else {
            client.close();
            return "Something went wrong.Try again later...!";
          }
        })
        .catchError((e) {
          return "Something went wrong.Try again later...!";
        });
  }

  Future<dynamic> post(String url, {body, encoding}) async {
    final client = InterceptedClient.build(
      interceptors: [CustomInterceptor()],
      retryPolicy: MyRetryPolicy(),
    );
    return client
        .post(Uri.parse(url), body: body, encoding: encoding)
        .then((response) {
          final String res = response.body;

          if (response.statusCode == 200) {
            try {
              client.close();
              return _decoder.convert(res);
            } catch (e) {
              client.close();
              return res;
            }
          } else if (response.statusCode == 400) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 404) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 406) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 500) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 405) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 401) {
            client.close();
            return _decoder.convert(res);
          } else if (response.statusCode == 451) {
            client.close();
            return _decoder.convert(res);
          } else {
            return "Something went wrong.Try again later...!";
          }
        })
        .catchError((e) {
          return "Something went wrong.Try again later...!";
        });
  }
}

class CustomInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    return true;
  }
}

class MyRetryPolicy extends RetryPolicy {
  @override
  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse? response) async {
    //500,503,410,404,301 , 302 , 307 or 308
    switch (response?.statusCode) {
      case 500:
        return true;
      case 503:
        return true;
      case 502:
        return true;
      case 410:
        return true;
      case 404:
        return true;
      case 301:
        return true;
      case 302:
        return true;
      case 307:
        return true;
      case 308:
        return true;
      default:
        return false;
    }
  }
}
