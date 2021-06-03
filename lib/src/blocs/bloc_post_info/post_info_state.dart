import 'package:equatable/equatable.dart';

abstract class PostInfoState extends Equatable {
  const PostInfoState();
}

class InitialPostInfoState extends PostInfoState {
  @override
  List<Object> get props => [];
}
