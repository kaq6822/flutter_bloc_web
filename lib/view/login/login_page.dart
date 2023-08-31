import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_web/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_web/model/login.dart';
import 'package:flutter_bloc_web/view/user/user_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var idController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인")),
      body: Center(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text("로그인 실패"),
                        content: Text(state.error),
                      ));
            } else if (state is LoginSuccess) {
              Navigator.of(context).pushNamed(UserPage.routeName);
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("로그인 페이지"),
                const SizedBox(height: 20),
                TextFormField(
                  controller: idController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "아이디",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "비밀번호",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    BlocProvider.of<LoginBloc>(context).add(Login(LoginReqModel(
                        id: int.parse(idController.text),
                        password: passwordController.text)));
                  },
                  child: const Text("로그인"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
