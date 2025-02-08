import 'package:flutter/material.dart';

import 'tree_node.dart';

class TreeView extends StatefulWidget {
  final TreeNode root;

  const TreeView({super.key, required this.root});

  @override
  State<TreeView> createState() => _TreeViewState();
}

class _TreeViewState extends State<TreeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.root.children.length,
      itemBuilder: (context, index) {
        return _buildNode(widget.root.children[index], widget.root);
      },
    );
  }

  Widget _buildNode(TreeNode node, TreeNode parent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            node.children.isNotEmpty
                ? IconButton(
                    icon: Icon(node.isExpanded ? Icons.remove : Icons.add),
                    onPressed: () {
                      setState(() {
                        node.isExpanded = !node.isExpanded;
                      });
                    },
                  )
                : const SizedBox(
                    width: 48,
                  ),
            Expanded(
              child: TextField(
                controller: TextEditingController(text: node.text),
                onChanged: (value) {
                  node.text = value;
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Checkbox(
              value: node.isChecked,
              onChanged: (value) {
                setState(() {
                  _updateCheckbox(node, value ?? false);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  node.addChild(TreeNode(
                    text: 'Новый элемент',
                  ));
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  parent.removeChild(node);
                });
              },
            ),
          ],
        ),
        if (node.isExpanded && node.children.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: node.children
                  .map((child) => _buildNode(child, node))
                  .toList(),
            ),
          ),
      ],
    );
  }

  void _updateCheckbox(TreeNode node, bool value) {
    node.isChecked = value;
    for (var child in node.children) {
      _updateCheckbox(child, value);
    }
    final parent = node.parent;
    if (parent != null) {
      _updateParentCheckbox(parent);
    }
  }

  void _updateParentCheckbox(TreeNode node) {
    bool allChildrenChecked = node.children.every((child) => child.isChecked);
    node.isChecked = allChildrenChecked;
    if (node.parent != null) {
      _updateParentCheckbox(node.parent!);
    }
  }
}
