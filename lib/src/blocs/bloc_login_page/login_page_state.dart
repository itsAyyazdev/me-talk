import 'package:equatable/equatable.dart';

abstract class LoginPageState extends Equatable {
  const LoginPageState();
}

class InitialLoginPageState extends LoginPageState {
  @override
  List<Object> get props => [];
}
