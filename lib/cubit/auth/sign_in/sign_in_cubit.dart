part of 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  
}
