import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/reorderable_list/bloc_listeners.dart';
import 'package:flutter_learning/reorderable_list/cubit/reorder_list_cubit.dart';
import 'package:flutter_learning/reorderable_list/cubit/send_ordered_items_cubit.dart';
import 'package:flutter_learning/reorderable_list/food_model.dart';

class ReorderListPage extends StatefulWidget {
  const ReorderListPage({super.key});

  @override
  State<ReorderListPage> createState() => _ReorderListPageState();
}

class _ReorderListPageState extends State<ReorderListPage> {
  @override
  Widget build(BuildContext context) {
    return ReorderListBlocListeners(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reorderable List Page'),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ReorderListCubit, ReorderListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return AnimatedReorderableGridView<Food>(
          items: state.items,
          itemBuilder: (BuildContext context, int index) {
            final food = state.items[index];
            final randomColor =
                Colors.primaries[index % Colors.primaries.length];
            return Card(
              color: randomColor,
              key: ValueKey(food.id),
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  food.title,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          sliverGridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          enterTransition: [FlipInX(), ScaleIn()],
          exitTransition: [SlideInLeft()],
          insertDuration: const Duration(milliseconds: 300),
          removeDuration: const Duration(milliseconds: 300),
          onReorder: (int oldIndex, int newIndex) {
            context.read<SendOrderedItemsCubit>().sendOrderedItems(
                  items: state.items,
                  oldIndex: oldIndex,
                  newIndex: newIndex,
                );
          },
          dragStartDelay: const Duration(milliseconds: 300),
          isSameItem: (a, b) => a.id == b.id,
        );
      },
    );
  }
}
