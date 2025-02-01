import 'package:flutter/material.dart';
import 'package:tree/tree_node.dart';
import 'package:tree/tree_view.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final TreeNode root = TreeNode(
      text: 'Корневой элемент',
      children: [
        TreeNode(text: 'Дочерний элемент 1'),
        TreeNode(
          text: 'Дочерний элемент 2',
          children: [
            TreeNode(text: 'Дочерний элемент 2.1'),
          ],
        ),
        TreeNode(text: 'Дочерний элемент 3'),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TreeView(root: root),
        ),
      ),
    );
  }
}

