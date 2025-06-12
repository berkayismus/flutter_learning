import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learning/reorderable_list/cubit/reorder_list_cubit.dart';
import 'package:flutter_learning/reorderable_list/cubit/send_ordered_items_cubit.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_page.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_repository.dart';

class ReorderListPageWrapperProvider extends StatelessWidget {
  const ReorderListPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ReorderListCubit(ReorderListRepository())..getItems(),
        ),
        BlocProvider(
            create: (_) => SendOrderedItemsCubit((ReorderListRepository()))),
      ],
      child: const ReorderListPage(),
    );
  }
}
