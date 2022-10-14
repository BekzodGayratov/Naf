abstract class HomeState {
  HomeState();
}

class UserInitialState extends HomeState {
  UserInitialState();
}

class UserLoadingState extends HomeState {
  UserLoadingState();
}

class UserCompleteState extends HomeState {
  UserCompleteState();
}

class UserErrorState extends HomeState {
  String error;
  UserErrorState(this.error);
}
