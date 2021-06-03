import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  @override
  LoginPageState get initialState => InitialLoginPageState();

  @override
  Stream<LoginPageState> mapEventToState(
    LoginPageEvent event,
  ) async* {}
}
