import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toktok/models/home_screen_models/user.dart';
import 'package:toktok/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthRepository authRepository = AuthRepository();
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is RequestLoginEvent) {
      yield* loginMapEventToState(event: event);
    }
  }

  Stream<LoginState> loginMapEventToState(
      {required RequestLoginEvent event}) async* {
    try {
      yield LoginLoading();
      User user = await authRepository.login(userModel: event.user);
      yield LoginSuccess(user: user);
    } catch (e) {
      yield LoginFailed(message: e.toString());
    }
  }
}
