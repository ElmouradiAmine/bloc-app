import 'dart:async';
import 'package:bloc_test3/models/user.dart';
import 'package:bloc_test3/widgets/bloc_provider.dart';
import 'package:bloc_test3/api/database_api.dart';

class UserBloc implements BlocBase {
  User _user;

  //StreamController _userListController = StreamController<List<User>>();
  StreamController<User> _userController = StreamController<User>.broadcast();
  Sink<User> get _inUser => _userController.sink;
  Stream<User> get outUser => _userController.stream;

  //==> ~EVENTS
  //Streams to handle the action on the user
  StreamController<User> _updateUserController = StreamController<User>();
  Sink<User> get updateUser => _updateUserController.sink;

  //Streams to handle the input of a new name
  StreamController<String> _updateNameController = StreamController<String>();
  Sink<String> get updateName => _updateNameController.sink;

  UserBloc() {
    api.getUser().then((user){
      _user = user;
      _inUser.add(_user);
    });
    _updateUserController.stream.listen(_updateUser);
    _updateNameController.stream.listen(_updateName);
  }

  void _updateUser(User user) {
    _user = User(user.name, user.age, user.height);
    _inUser.add(_user);
  }

  void _updateName(String name) {
    _user.name = name;
    _inUser.add(_user);
  }

  @override
  void dispose() {
    _userController.close();
    _updateUserController.close();
    _updateNameController.close();
    //_userListController.close();
  }
}
