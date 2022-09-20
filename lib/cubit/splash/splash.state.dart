
import 'package:bloc/bloc.dart';

part 'splash.cubit.dart';

abstract class SplashState {
  SplashState();
}

class SplashInitialState extends SplashState {
  SplashInitialState();
}

class SplashFoundUserState extends SplashState {
  SplashFoundUserState();
}

class SplashNotFoundUserState extends SplashState {
  SplashNotFoundUserState();
}

class SplashErrorState extends SplashState {
  SplashErrorState();
}
