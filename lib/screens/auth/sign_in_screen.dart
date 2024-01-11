import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc_firebase/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:learn_bloc_firebase/constant.dart';
import 'package:learn_bloc_firebase/screens/components/text_field_custom.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPassword = CupertinoIcons.eye;
  bool obsecurePassword = false;
  String? _errorMsg;
  // Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: deviceWidth(context) * 0.9,
            child: TextFieldCustom(
              controller: emailController,
              hintText: 'Email',
              keyBoardType: TextInputType.emailAddress,
              prefixIcon: const Icon(
                CupertinoIcons.mail_solid,
              ),
              errMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+.)+[\w-]{2,4}$')
                    .hasMatch(val)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: deviceWidth(context) * 0.9,
            child: TextFieldCustom(
              controller: passwordController,
              hintText: 'Password',
              keyBoardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(
                CupertinoIcons.lock_circle_fill,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePassword = !obsecurePassword;
                  });
                },
                icon: Icon(
                  obsecurePassword
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                ),
              ),
              isObsecure: obsecurePassword,
              errMsg: _errorMsg,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in this field';
                } else if (val.length < 8) {
                  return 'Your password less than 8 character';
                }
                return null;
              },
            ),
          ),
          !signInRequired
              ? Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: deviceWidth(context) * 0.5,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        elevation: 2,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<SignInBloc>().add(
                              SignInRequired(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator()
        ],
      ),
    );
  }
}
