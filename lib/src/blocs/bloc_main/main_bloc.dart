import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'bloc.dart';

class MainBloc extends HydratedBloc<MainEvent, MainState> {
  String name = "Ram";
  @override
  MainState get initialState => InitialMainState();

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
  }

  @override
  fromJson(Map<String, dynamic> json) {
    
    return null;
  }

  @override
  Map<String, dynamic> toJson(state) {
   
    return null;
  }
}
