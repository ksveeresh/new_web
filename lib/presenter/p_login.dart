import 'package:new_web/helper/datasource.dart';

abstract class LoginContract {
  void onLoginSuccess(dynamic data);
  void onLoginError(dynamic data);
  void showLoader();
  void hideLoader();
}

class PLogin {
  final LoginContract _view;
  RestDatasource api = RestDatasource();
  PLogin(this._view);

  login(Map<String, dynamic> map) {
    _view.showLoader();
    api
        .loginFunction(map)
        .then((value) {
          if (value is String) {
            _view.hideLoader();
            _view.onLoginError(value);
          } else {
            _view.hideLoader();
            _view.onLoginSuccess(value);
          }
        })
        .catchError((Object error) async {});
  }
}
