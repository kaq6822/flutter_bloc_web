import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_web/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_web/repository/login.dart';
import 'package:flutter_bloc_web/view/login/login_page.dart';
import 'package:flutter_bloc_web/view/user/user_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginBloc(LoginRepository()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: routes,
    );
  }
}

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  UserPage.routeName: (context) => const UserPage(),
};
