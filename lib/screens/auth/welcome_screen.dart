import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_firebase/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:learn_bloc_firebase/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:learn_bloc_firebase/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:learn_bloc_firebase/constant.dart';
import 'package:learn_bloc_firebase/screens/auth/sign_in_screen.dart';
import 'package:learn_bloc_firebase/screens/auth/sign_up_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: deviceHeight(context),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -5),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.1,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2.7, -4.5),
                child: Container(
                  height: deviceHeight(context) / 1.2,
                  width: deviceWidth(context) / 1.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -4.5),
                child: Container(
                  height: deviceHeight(context) / 1.2,
                  width: deviceWidth(context) / 1.2,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amberAccent,
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: deviceHeight(context) / 1.5,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: TabBar(
                          indicatorWeight: 0.5,
                          dividerHeight: 0.3,
                          dividerColor: Colors.blue,
                          controller: tabController,
                          unselectedLabelColor: Colors.grey.withOpacity(0.5),
                          labelColor: Colors.black,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            BlocProvider<SignInBloc>(
                              create: (context) => SignInBloc(
                                userRepository: context
                                    .read<AuthenticationBloc>()
                                    .userRepository,
                              ),
                              child: const SignInScreen(),
                            ),
                            BlocProvider<SignUpBloc>(
                              create: (context) => SignUpBloc(
                                userRepository: context
                                    .read<AuthenticationBloc>()
                                    .userRepository,
                              ),
                              child: const SignUpScreen(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
