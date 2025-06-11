import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/favorite_menu/cubit/favorite_cubit.dart';
import 'package:flutter_learning/favorite_menu/cubit/menu_cubit.dart';
import 'package:flutter_learning/favorite_menu/menu_page.dart';
import 'package:flutter_learning/favorite_menu/menu_repository.dart';

class MenuPageWrapperProvider extends StatelessWidget {
  const MenuPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(MenuRepository()),
        )
      ],
      child: const MenuPage(),
    );
  }
}
