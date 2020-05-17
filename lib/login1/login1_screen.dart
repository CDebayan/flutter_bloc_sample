import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsample/login1/bloc/login1_bloc.dart';
import 'package:flutterblocsample/login1/event/login1_event.dart';
import 'package:flutterblocsample/login1/state/login1_state.dart';
import 'package:flutterblocsample/widgets.dart';

class Login1Screen extends StatelessWidget {
  static const String routeName = "Login1Screen";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Login1Bloc(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<Login1Bloc, Login1State>(builder: (_, state) {
                  return EditTextField(
                    controller: _emailController,
                    hint: "Email",
                    errorText: state is Finished
                        ? state.loginValidationModel.emailError
                        : null,
                  );
                }),
                BlocBuilder<Login1Bloc, Login1State>(builder: (_, state) {
                  return EditTextField(
                    controller: _passwordController,
                    hint: "Password",
                    errorText: state is Finished
                        ? state.loginValidationModel.passwordError
                        : null,
                  );
                }),
                SizedBox(
                  height: 16,
                ),
                _button(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer _button() {
    return BlocConsumer<Login1Bloc, Login1State>(
      builder: (context, state) {
        if (state is Initial || state is Finished) {
          return Button(
              text: "Login",
              onPressed: () {
                BlocProvider.of<Login1Bloc>(context).add(
                  LoginButtonPressed(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              });
        } else if (state is Loading) {
          return CircularProgressIndicator();
        } else {
          return null;
        }
      },
      listener: (context, state) {
        if (state is Finished) {
          if(state.loginValidationModel.message != null){
            showToast(message: state.loginValidationModel.message);
          }
        }

        return null;
      },
    );
  }
}
