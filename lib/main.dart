import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocsample/counter1/counter1_screen.dart';
import 'package:flutterblocsample/counter2/bloc/counter2_bloc.dart';
import 'package:flutterblocsample/counter2/counter2_screen.dart';
import 'package:flutterblocsample/home_screen.dart';
import 'package:flutterblocsample/login1/login_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Counter2Bloc>(create: (BuildContext context) => Counter2Bloc()),
        //BlocProvider<LoginBloc>(create: (BuildContext context) => LoginBloc()),
      ],
      child: MaterialApp(
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName : (context) => HomeScreen(),
          Counter1Screen.routeName : (context) => Counter1Screen(),
          Counter2Screen.routeName : (context) => Counter2Screen(),
          LoginScreen.routeName : (context) => LoginScreen(),
        },
      ),
    );
  }
}
