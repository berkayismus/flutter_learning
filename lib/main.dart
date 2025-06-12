import 'package:flutter/material.dart';
import 'package:flutter_learning/favorite_menu/bloc_providers.dart';
import 'package:flutter_learning/reorderable_list/bloc_providers.dart';
import 'package:flutter_learning/reorderable_list/reorder_list_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning',
      home: ReorderListPageWrapperProvider(),
    );
  }
}
