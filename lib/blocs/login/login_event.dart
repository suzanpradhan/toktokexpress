part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class RequestLoginEvent extends LoginEvent {
  final User user;
  RequestLoginEvent({required this.user});

  @override
  List<Object> get props => [user];
}
