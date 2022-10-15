part of 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    emit(SignInLoadingState());
    emit(state);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      emit(SignInCompleteState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInErrorState("notRegister".tr()));
      } else if (e.code == 'wrong-password') {
        emit(SignInErrorState("wrongPass".tr()));
      } else {
        emit(SignInErrorState(e.message.toString()));
      }
    }
  }

  deavtiveFields() {
    emailController.clear();
    passwordController.clear();
  }
}
