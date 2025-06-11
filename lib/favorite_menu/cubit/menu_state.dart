part of 'menu_cubit.dart';

class MenuState extends Equatable {
  final List<MenuItemModel> items;

  const MenuState({
    required this.items,
  });

  factory MenuState.initial() {
    return const MenuState(
      items: [
        MenuItemModel(title: 'Pizza', isFavorite: false),
        MenuItemModel(title: 'Burger', isFavorite: false),
        MenuItemModel(title: 'Pasta', isFavorite: false),
        MenuItemModel(title: 'Salad', isFavorite: false),
        MenuItemModel(title: 'Sushi', isFavorite: false),
      ],
    );
  }

  @override
  List<Object> get props => [
        items,
      ];
}
