import 'package:bloc_test3/models/user.dart';

class DbApi {
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    User _user = User('Amine Elmouradi', 21, 197.0);
    return _user;
    
  }
}

DbApi api = DbApi();