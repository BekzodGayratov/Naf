part of 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp() async {
    emit(SignUpLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "barry.allen@example.com", password: "SuperSecretPassword!");
      emit(SignUpCompleteState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpErrorState("weakPass".tr()));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpErrorState("alreadyGet".tr()));
      } else {
        emit(SignUpErrorState(e.code.toString()));
      }
    }
  }

  clearFields() {
    emailController.clear();
    passwordController.clear();
  }
}
