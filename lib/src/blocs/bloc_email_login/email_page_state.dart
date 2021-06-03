import 'package:equatable/equatable.dart';

abstract class EmailPageState extends Equatable {
  const EmailPageState();
}

class InitialEmailPageState extends EmailPageState {
  @override
  List<Object> get props => [];
}
