class TreeNode {
  String text;
  bool isExpanded;
  bool isChecked;
  List<TreeNode> children = <TreeNode>[];
  TreeNode? parent;

  TreeNode({
    required this.text,
    this.isExpanded = false,
    this.isChecked = false,
    List<TreeNode> children = const [],
  }) {
    if (children.isNotEmpty) {
      for (var element in children) {
        addChild(element);
      }
    }
    
  }

  void addChild(TreeNode child) {
    child.parent = this;
    children.add(child);
  }
}
