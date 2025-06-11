import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/favorite_menu/cubit/favorite_cubit.dart';
import 'package:flutter_learning/favorite_menu/cubit/menu_cubit.dart';

class MenuPageBlocListeners extends StatelessWidget {
  const MenuPageBlocListeners({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FavoriteCubit, FavoriteState>(
          listener: _listenFavoriteState,
        ),
      ],
      child: child,
    );
  }

  void _listenFavoriteState(BuildContext context, state) {
    if (state is FavoriteLoading) {
      context.read<MenuCubit>().favorite(state.item);
    } else if (state is FavoriteLoaded) {
    } else if (state is FavoriteFailure) {
      context.read<MenuCubit>().favorite(state.item);
    }
  }
}
