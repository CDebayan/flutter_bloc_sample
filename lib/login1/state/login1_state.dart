import 'package:equatable/equatable.dart';
import 'package:flutterblocsample/login1/model/login1_validation_model.dart';

abstract class Login1State extends Equatable {
  const Login1State();
  @override
  List<Object> get props => [];
}

class Initial extends Login1State {}

class Loading extends Login1State {}

class Finished extends Login1State {
  final Login1ValidationModel loginValidationModel;
  Finished(this.loginValidationModel);

  @override
  List<Object> get props => [loginValidationModel];
}
