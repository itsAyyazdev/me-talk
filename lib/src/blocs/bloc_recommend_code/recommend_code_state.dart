import 'package:equatable/equatable.dart';

abstract class RecommendCodeState extends Equatable {
  const RecommendCodeState();
}

class InitialRecommendCodeState extends RecommendCodeState {
  @override
  List<Object> get props => [];
}
