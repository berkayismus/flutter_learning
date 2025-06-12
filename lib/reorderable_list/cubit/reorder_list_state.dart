part of 'reorder_list_cubit.dart';

class ReorderListState extends Equatable {
  const ReorderListState({
    required this.isLoading,
    required this.items,
  });

  final bool isLoading;
  final List<Food> items;

  factory ReorderListState.initial() {
    return const ReorderListState(
      isLoading: false,
      items: [],
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        items,
      ];

  ReorderListState copyWith({
    bool? isLoading,
    List<Food>? items,
  }) {
    return ReorderListState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
    );
  }
}
