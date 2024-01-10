import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_firebase/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:learn_bloc_firebase/screens/auth/welcome_screen.dart';
import 'package:learn_bloc_firebase/screens/home/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Firebase Auth',
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            focusColor: Colors.purple,
            // prefixIconColor:
            //     MaterialStateColor.resolveWith((Set<MaterialState> states) {
            //   if (states.contains(MaterialState.focused)) {
            //     return Colors.purple;
            //   }
            //   if (states.contains(MaterialState.error)) {
            //     return Colors.red;
            //   }
            //   return Colors.grey;
            // }),
          ),
          colorScheme: ColorScheme.light(
            background: Colors.grey,
            error: Colors.redAccent,
            outline: Colors.blueGrey,
            tertiary: Colors.yellowAccent,
            primary: Colors.purple.withOpacity(0.7),
            onPrimary: Colors.lightBlue,
            secondary: Colors.purpleAccent,
            onSecondary: Colors.lightBlueAccent,
          ),
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state.authenticationStatus ==
                AuthenticationStatus.authenticated) {
              return const HomeScreen();
            } else {
              return const WelcomeScreen();
            }
          },
        ));
  }
}
