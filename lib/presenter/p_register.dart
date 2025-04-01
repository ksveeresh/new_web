import 'package:new_web/helper/datasource.dart';

abstract class RegisterContract {
  void onRegisterSuccess(dynamic data);
  void onRegisterError(dynamic data);
  void showLoader();
  void hideLoader();
}

class PRegister {
  final RegisterContract _view;
  RestDatasource api = RestDatasource();
  PRegister(this._view);

  register(Map<String, dynamic> map) {
    _view.showLoader();
    api
        .registerFunction(map)
        .then((value) {
          if (value is String) {
            _view.hideLoader();
            _view.onRegisterError(value);
          } else {
            _view.hideLoader();
            _view.onRegisterSuccess(value);
          }
        })
        .catchError((Object error) async {});
  }
}
