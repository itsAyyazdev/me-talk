import 'package:equatable/equatable.dart';

abstract class ShopProfileState extends Equatable {
  const ShopProfileState();
}

class InitialShopProfileState extends ShopProfileState {
  @override
  List<Object> get props => [];
}
