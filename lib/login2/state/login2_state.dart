import 'package:equatable/equatable.dart';
import 'package:flutterblocsample/login2/model/login2_validation_model.dart';

abstract class Login2State extends Equatable {
  const Login2State();

  @override
  List<Object> get props => [];
}

class Initial extends Login2State {}

class Loading extends Login2State {}

class Finished extends Login2State {
  final Login2ValidationModel loginValidationModel;

  Finished(this.loginValidationModel);

  @override
  List<Object> get props => [loginValidationModel];
}
