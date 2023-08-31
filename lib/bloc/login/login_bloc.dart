import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_web/model/login.dart';
import 'package:flutter_bloc_web/repository/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<Login>((event, emit) async {
      try {
        var value = await loginRepository.login(event.loginReqModel);
        emit(LoginSuccess(value));
      } catch (error) {
        print(error.toString());
        emit(LoginFailure(error.toString()));
      }
    });
  }
}
