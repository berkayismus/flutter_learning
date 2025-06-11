part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {
  final MenuItemModel item;

  const FavoriteLoading({required this.item});

  @override
  List<Object> get props => [item];
}

final class FavoriteLoaded extends FavoriteState {}

final class FavoriteFailure extends FavoriteState {
  final MenuItemModel item;

  const FavoriteFailure({required this.item});

  @override
  List<Object> get props => [item];
}
