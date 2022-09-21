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
  UserCompleteState();
}

class UserErrorState extends UserState {
  String error;
  UserErrorState(this.error);
}
