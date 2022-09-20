import 'package:responsive/data/model/user_model.dart';

abstract class UserState {
  UserState();
}

class UserInitialState extends UserState {
  UserInitialState();
}

class UserLoadingState extends UserState {
  UserLoadingState();
}

class UserCompleteState extends UserState {
  List<UserModel> data;
  UserCompleteState(this.data);
}

class UserErrorState extends UserState {
  String error;
  UserErrorState(this.error);
}
