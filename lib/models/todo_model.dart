class TodoItem {
  const TodoItem({
    required this.title,
    required this.checked,
  });

  final String title;
  final bool checked;

  TodoItem copyWith({String? title, bool? checked}) {
    return TodoItem(
      title: title ?? this.title,
      checked: checked ?? this.checked,
    );
  }
}
