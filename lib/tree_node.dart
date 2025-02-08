class TreeNode {
  String text;
  bool isExpanded;
  bool isChecked;
  List<TreeNode> _children = <TreeNode>[];
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
    _children.add(child);
  }

  void removeChild(TreeNode child) {
    _children.remove(child);
  }

  List<TreeNode> get children => _children;
}
