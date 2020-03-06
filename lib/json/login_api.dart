
class LoginBean{
  String token;
  int status;

  static LoginBean fromMap(Map<String, dynamic> map) {
    LoginBean loginBean = new LoginBean();
    loginBean.status = map['status'];
    loginBean.token = map['token'];
    return loginBean;
  }

  static List<LoginBean> fromMapList(dynamic mapList) {
    List<LoginBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}