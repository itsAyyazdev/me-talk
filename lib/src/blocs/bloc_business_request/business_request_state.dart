import 'package:equatable/equatable.dart';

abstract class BusinessRequestState extends Equatable {
  const BusinessRequestState();
}

class InitialBusinessRequestState extends BusinessRequestState {
  @override
  List<Object> get props => [];
}
