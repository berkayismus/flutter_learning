import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/reorderable_list/cubit/reorder_list_cubit.dart';
import 'package:flutter_learning/reorderable_list/cubit/send_ordered_items_cubit.dart';

class ReorderListBlocListeners extends StatelessWidget {
  const ReorderListBlocListeners({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SendOrderedItemsCubit, SendOrderedItemsState>(
          listener: _listenSendOrderedItemsCubit,
        ),
      ],
      child: child,
    );
  }

  void _listenSendOrderedItemsCubit(
      BuildContext context, SendOrderedItemsState state) {
    if (state is SendOrderedItemsLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sending ordered items...')),
      );

      context
          .read<ReorderListCubit>()
          .reOrder(oldIndex: state.oldIndex, newIndex: state.newIndex);
    } else if (state is SendOrderedItemsLoaded) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ordered items sent successfully!')),
      );
    } else if (state is SendOrderedItemsFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send ordered items.')),
      );

      context
          .read<ReorderListCubit>()
          .reOrder(oldIndex: state.newIndex, newIndex: state.oldIndex);
    }
  }
}
