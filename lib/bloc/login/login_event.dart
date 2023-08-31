part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class Login extends LoginEvent {
  final LoginReqModel loginReqModel;

  const Login(this.loginReqModel);

  @override
  List<Object> get props => [loginReqModel];
}
