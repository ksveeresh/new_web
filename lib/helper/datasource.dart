import 'dart:async';
import 'dart:convert';

import 'package:new_web/helper/network_utilities.dart';

class RestDatasource {
  final NetworkUtil _netUtil = NetworkUtil();
  static String baseUrl1 = "http://app.kesarlas.com";

  static final register = "$baseUrl1/users";
  static final login = "$baseUrl1/login";

  registerFunction(Map<String, dynamic> data) {
    final completer = Completer<dynamic>();
    _netUtil
        .post(register, body: const JsonEncoder().convert(data))
        .then((dynamic res) {
          if (!(res as Map).containsKey("error")) {
            completer.complete(res);
          } else {
            completer.complete(res["error"]);
          }
        })
        .catchError((onError) {
          completer.complete("Something went wrong.Try again later...!");
        })
        .onError((error, stackTrace) {
          completer.complete("Something went wrong.Try again later...!");
        });
    return completer.future;
  }

  loginFunction(Map<String, dynamic> data) {
    final completer = Completer<dynamic>();
    _netUtil
        .post(login, body: const JsonEncoder().convert(data))
        .then((dynamic res) {
          if (!(res as Map).containsKey("error")) {
            completer.complete(res);
          } else {
            completer.complete(res["error"]);
          }
        })
        .catchError((onError) {
          completer.complete("Something went wrong.Try again later...!");
        })
        .onError((error, stackTrace) {
          completer.complete("Something went wrong.Try again later...!");
        });
    return completer.future;
  }
}
