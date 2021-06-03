import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RecommendCodeBloc extends Bloc<RecommendCodeEvent, RecommendCodeState> {
  @override
  RecommendCodeState get initialState => InitialRecommendCodeState();

  @override
  Stream<RecommendCodeState> mapEventToState(
    RecommendCodeEvent event,
  ) async* {}
}
