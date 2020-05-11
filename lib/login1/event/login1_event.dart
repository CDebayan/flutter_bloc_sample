

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class Login1Event extends Equatable {
  const Login1Event();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends Login1Event{
  final String email;
  final String password;

  LoginButtonPressed({@required this.email,@required this.password});
}

