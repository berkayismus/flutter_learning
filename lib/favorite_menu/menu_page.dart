import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/favorite_menu/bloc_listeners.dart';
import 'package:flutter_learning/favorite_menu/cubit/favorite_cubit.dart';
import 'package:flutter_learning/favorite_menu/cubit/menu_cubit.dart';
import 'package:flutter_learning/favorite_menu/menu_item_model.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MenuPageBlocListeners(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite menu page'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<MenuCubit, MenuState>(
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = state.items[index];
            return MenuItemWidget(item: item);
          },
        );
      },
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({
    super.key,
    required this.item,
  });

  final MenuItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Text(item.title, style: const TextStyle(fontSize: 50)),
            const SizedBox(height: 10),
            IconButton(
              icon: Icon(
                item.isFavorite ? Icons.star : Icons.star_border_outlined,
                color: Colors.yellow[900],
              ),
              onPressed: () {
                context.read<FavoriteCubit>().favorite(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
