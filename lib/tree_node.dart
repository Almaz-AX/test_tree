class TreeNode {
  String text;
  bool isExpanded;
  bool isChecked;
  List<TreeNode> children;

  TreeNode({
    required this.text,
    this.isExpanded = false,
    this.isChecked = false,
    this.children = const [],
  });
}