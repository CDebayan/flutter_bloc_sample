

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class Login2Event extends Equatable {
  const Login2Event();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends Login2Event{
  final String email;
  final String password;

  LoginButtonPressed({@required this.email,@required this.password});
}

