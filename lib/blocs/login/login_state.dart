part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess({required this.user});

  @override
  List<Object> get props => [user];
}

class LoginFailed extends LoginState {
  final String message;
  LoginFailed({required this.message});

  @override
  List<Object> get props => [message];
}