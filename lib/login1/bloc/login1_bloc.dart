import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterblocsample/login1/event/login1_event.dart';
import 'package:flutterblocsample/login1/model/login1_validation_model.dart';
import 'package:flutterblocsample/login1/state/login1_state.dart';
import 'package:flutterblocsample/functionality.dart';

class Login1Bloc extends Bloc<Login1Event, Login1State>{
  @override
  Login1State get initialState => Initial();

  @override
  Stream<Login1State> mapEventToState(Login1Event event) async*{
    if (event is LoginButtonPressed){
      yield Loading();

      Login1ValidationModel _loginValidationModel = await _validateLogin(event);

      yield Finished(_loginValidationModel);

    }
  }


  Future<Login1ValidationModel> _validateLogin(LoginButtonPressed event) async{
    bool validationError = false;
    Login1ValidationModel model = Login1ValidationModel();

    if(!_isValidEmail(event.email,model)){
      validationError = true;
    }
    if(!_isValidPassword(event.password,model)){
      validationError = true;
    }

    if (validationError) {
      return model;
    }

    return Future.delayed(
      Duration(seconds: 2),
          () {
        return Login1ValidationModel(status: true,message: "Logged in");
      },
    );
  }

  bool _isValidEmail(String email,Login1ValidationModel model) {
    List validateEmail = Functionality.validateEmail(email);
    model.emailError =  validateEmail[1];
    return validateEmail[0];
  }

  bool _isValidPassword(String password,Login1ValidationModel model) {
    List validatePassword = Functionality.validatePassword(password);
    model.passwordError =  validatePassword[1];
    return validatePassword[0];
  }

}
