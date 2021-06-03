import 'package:equatable/equatable.dart';

abstract class BusinessProfileState extends Equatable {
  const BusinessProfileState();
}

class InitialBusinessProfileState extends BusinessProfileState {
  @override
  List<Object> get props => [];
}
