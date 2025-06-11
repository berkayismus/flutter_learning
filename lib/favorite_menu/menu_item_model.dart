import 'package:equatable/equatable.dart';

class MenuItemModel extends Equatable {
  final String title;
  final bool isFavorite;

  const MenuItemModel({
    required this.title,
    this.isFavorite = false,
  });

  MenuItemModel copyWith({
    String? title,
    bool? isFavorite,
  }) {
    return MenuItemModel(
      title: title ?? this.title,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object> get props => [title, isFavorite];
}
