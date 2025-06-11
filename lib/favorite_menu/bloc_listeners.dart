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
      /*  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favori yükleniyor...')),
      ); */

      context.read<MenuCubit>().favorite(true, state.item);
    } else if (state is FavoriteLoaded) {
      /*  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favori yüklendi!')),
      ); */
    } else if (state is FavoriteFailure) {
      /*  ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favori yüklenemedi!')),
      ); */
      context.read<MenuCubit>().favorite(false, state.item);
    }
  }
}
