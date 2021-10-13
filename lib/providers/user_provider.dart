import 'package:flutter/material.dart';

/*{code: 200,
msg: 登录成功,
data:
{id: 340000201306105585,
username: 傅超,
avatar: http://dummyimage.com/50x50/f28079,
email: j.tjugqkj@eqtmwq.lb,
token: EFD2c33B-db75-Ad37-9cE1-A7Fddb0DF53a,
expires_time: 17924112707}}

 */
class UserProvider with ChangeNotifier {
  bool _isLogin = false;
  Map _userInfo = {};

  bool get isLogin => _isLogin;
  Map get userInfo => _userInfo;

  void initUser(Map userInfo) {
    _userInfo = userInfo;
    _isLogin = true;

    notifyListeners();
  }

  void logout() {
    _userInfo = {};
    _isLogin = false;

    notifyListeners();
  }
}