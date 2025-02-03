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
    List<TreeNode> children = const[],
  }) {
    this.children.addAll(children);
    if (this.children.isNotEmpty) {
      for (var node in this.children) {
        node.parent = this;
      }
    }
  }

  void addChild(TreeNode child) {
    child.parent = this;
    children.add(child);
  }

}
