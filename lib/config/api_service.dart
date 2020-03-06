
import 'package:test_bloc/config/api_strategy.dart';
import 'package:test_bloc/json/login_api.dart';
export 'package:dio/dio.dart';

class ApiService {

factory ApiService() => _getInstance();

  static ApiService get instance => _getInstance();
  static ApiService _instance;

  static final int requestSucceed = 0;
  static final int requestFailed = 1;

  ApiService._internal() {
  }
  static ApiService _getInstance() {
    if (_instance == null) {
      _instance = new ApiService._internal();
    }
    return _instance;
  }

  void login({
    Map<String, String> params,
    Function success,
    Function failed,
    Function error,
    CancelToken token,
  }) {
    ApiStrategy.getInstance().post(
        "login",
        (data) {
          LoginBean loginBean = LoginBean.fromMap(data);
          if (loginBean.status == requestSucceed) {
            success(loginBean);
          } else {
            failed(loginBean);
          }
        },
        params: params,
        errorCallBack: (errorMessage) {
          error(errorMessage);
        },token: token);
  }
}
