part of 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());
  //

  TextEditingController nameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser!.displayName);

  void updateName() async {
    emit(ProfileLoadingState());

    await FirebaseAuth.instance.currentUser!
        .updateDisplayName(nameController.text);
    emit(ProfileCompleteState());
  }
}
