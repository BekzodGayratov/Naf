import 'package:bloc/bloc.dart';
import 'package:responsive/cubit/home/user_state.dart';
import 'package:responsive/data/model/user_model.dart';
import 'package:responsive/data/service/get_user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()) {
    getUser();
  }

  // User logic here...

  void getUser() async {
    emit(UserLoadingState());
    await UserServce.getUser().then((response) {
      if (response is List<UserModel>) {
        emit(UserCompleteState(response));
      } else {
        emit(UserErrorState(response.toString()));
      }
    });
  }
}
