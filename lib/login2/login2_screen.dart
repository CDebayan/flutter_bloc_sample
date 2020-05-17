import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsample/login2/bloc/login2_bloc.dart';
import 'package:flutterblocsample/login2/event/login2_event.dart';
import 'package:flutterblocsample/login2/state/login2_state.dart';
import 'package:flutterblocsample/widgets.dart';

class Login2Screen extends StatelessWidget {
  static const String routeName = "Login2Screen";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext _context) {
    return BlocProvider(
      create: (_) => Login2Bloc(),
      child: Builder(
         builder: (context){
           return Scaffold(
             body: SingleChildScrollView(
               child: Container(
                 padding: EdgeInsets.only(left: 16, right: 16),
                 height: MediaQuery.of(context).size.height,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     StreamBuilder<String>(
                       stream:BlocProvider.of<Login2Bloc>(context).email,
                       builder: (context, snapshot) {
                         return EditTextField(
                           controller: _emailController,
                           hint: "Email",
                           onChanged: BlocProvider.of<Login2Bloc>(context).onEmailChanged,
                           errorText:  snapshot.error,
                         );
                       },
                     ),

                     StreamBuilder<String>(
                       stream:BlocProvider.of<Login2Bloc>(context).password,
                       builder: (context, snapshot) {
                         return EditTextField(
                           controller: _passwordController,
                           hint: "Email",
                           onChanged: BlocProvider.of<Login2Bloc>(context).onPasswordChanged,
                           errorText:  snapshot.error,
                         );
                       },
                     ),

                     SizedBox(
                       height: 16,
                     ),
                     _button(),
                   ],
                 ),
               ),
             ),
           );
         },
      ),
    );
  }

  BlocConsumer _button() {
    return BlocConsumer<Login2Bloc, Login2State>(
      builder: (context, state) {
        if (state is Initial || state is Finished) {
          return Button(
              text: "Login",
              onPressed: () {
                BlocProvider.of<Login2Bloc>(context).add(
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
          if (state.loginValidationModel.message != null) {
            showToast(message: state.loginValidationModel.message);
          }
        }

        return null;
      },
    );
  }
}
