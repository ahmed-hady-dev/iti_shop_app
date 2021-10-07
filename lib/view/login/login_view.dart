import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../constants/app_colors.dart';
import '../../core/router/router.dart';
import '../home/home_view.dart';
import '../../widgets/email_text_field.dart';
import '../../widgets/main_button.dart';
import '../../widgets/password_text_field.dart';

import 'controller/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                if (state.loginModel.status == "Error") {
                  Fluttertoast.showToast(msg: state.loginModel.msg.toString());
                } else {
                  MagicRouter.navigateAndPopAll(const HomeView());
                }
              }
            },
            builder: (context, state) {
              final cubit = LoginCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.00),
                      child: Text(
                        "Login\nnow.",
                        style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.w900,
                            color: AppColors.purple,
                            height: 0.9),
                      ),
                    ),
                    EmailTextField(
                        hintText: "Username",
                        controller: cubit.emailController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        }),
                    const SizedBox(height: 12.0),
                    PasswordTextField(
                        hintText: "Password",
                        controller: cubit.passwordController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        },
                        obscureText: cubit.isPassword,
                        onPressed: () => cubit.changePasswordVisibility(),
                        icon: cubit.suffix),
                    const SizedBox(height: 32.0),
                    Conditional.single(
                      context: context,
                      conditionBuilder: (context) => state is LoginLoadingState,
                      widgetBuilder: (context) => const SizedBox(
                        height: 48.0,
                        width: double.infinity,
                        child: Center(
                            child: CupertinoActivityIndicator(
                                radius: 16.0, animating: true)),
                      ),
                      fallbackBuilder: (context) => MainButton(
                        text: "Login",
                        onPressed: () async {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.userLogin(
                                username: cubit.emailController.text,
                                password: cubit.passwordController.text);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text('Copy this username and password 123 : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                          SizedBox(height: 8.0),
                          SelectableText('mor_2314',
                              style: TextStyle(fontSize: 16.0))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
