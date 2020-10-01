import 'package:flutter/widgets.dart';
import 'package:appwrite/appwrite.dart';

class AuthState extends ChangeNotifier {
  Client client = Client();
  Account account;

  AuthState() {
    _init();
  }

  _init() {
    account = Account(client);
    client
        .setEndpoint('http://192.168.1.103:4003/v1')
        .setProject('5f71b0a937fe4');
    //_checkIsLoggedIn();
  }

  _checkIsLoggedIn() async {
    try {
      var res = await account.get();
      print(res);
    } catch (e) {
      print(e.message);
    }
  }

  createAccount(String email, String password) async {
    try {
      var result = await account.create(email: email, password: password);
      print(result);
    } catch (error) {
      print(error.message);
    }
  }

  login(String email, String password) async {
    try {
      var result =
          await account.createSession(email: email, password: password);
      print(result);
    } catch (error) {
      print(error.message);
    }
  }
}
