import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class InitialDashboardState extends DashboardState {
  @override
  List<Object> get props => [];
}
