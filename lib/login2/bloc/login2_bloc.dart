import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterblocsample/login2/event/login2_event.dart';
import 'package:flutterblocsample/login2/model/login2_validation_model.dart';
import 'package:flutterblocsample/login2/state/login2_state.dart';
import 'package:flutterblocsample/functionality.dart';
import 'package:flutterblocsample/validators.dart';

class Login2Bloc extends Bloc<Login2Event, Login2State> with Validators{
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password => _passwordController.stream.transform(passwordValidator);

  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;

  @override
  Login2State get initialState => Initial();

  @override
  Stream<Login2State> mapEventToState(Login2Event event) async* {
    if (event is LoginButtonPressed) {
      yield Loading();

      Login2ValidationModel _loginValidationModel = await _validateLogin(event);

      yield Finished(_loginValidationModel);
    }
  }


  Future<Login2ValidationModel> _validateLogin(LoginButtonPressed event) async {
    bool validationError = false;
    Login2ValidationModel model = Login2ValidationModel();

    if (!_isValidEmail(event.email, model)) {
      validationError = true;
    }
    if (!_isValidPassword(event.password, model)) {
      validationError = true;
    }

    if (validationError) {
      return model;
    }

    return Future.delayed(
      Duration(seconds: 2),
          () {
        return Login2ValidationModel(status: true, message: "Logged in");
      },
    );
  }

  bool _isValidEmail(String email, Login2ValidationModel model) {
    List validateEmail = Functionality.validateEmail(email);
    model.emailError = validateEmail[1];
    return validateEmail[0];
  }

  bool _isValidPassword(String password, Login2ValidationModel model) {
    List validatePassword = Functionality.validatePassword(password);
    model.passwordError = validatePassword[1];
    return validatePassword[0];
  }

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}
