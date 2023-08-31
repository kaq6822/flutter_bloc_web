part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  final LoginResModel loginResModel;

  const LoginSuccess(this.loginResModel);

  @override
  List<Object> get props => [loginResModel];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}