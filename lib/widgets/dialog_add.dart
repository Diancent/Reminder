import 'package:flutter/material.dart';
import 'package:reminder/models/todo_model.dart';

class DialogAdd extends StatefulWidget {
  const DialogAdd({Key? key}) : super(key: key);

  @override
  _DialogAddState createState() => _DialogAddState();
}

class _DialogAddState extends State<DialogAdd> {
  final List<TodoItem> todoList = <TodoItem>[];
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Додайте задачу до свого списку'),
      content: TextField(
        controller: textController,
        decoration: InputDecoration(labelText: 'Введіть задачу'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            addItemToList(textController.text);
          },
          child: Text('Add'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(236, 80, 96, 1),
            ),
          ),
        ),
      ],
    );
  }

  void addItemToList(String title) {
    setState(() {
      todoList.add(TodoItem(title: title, checked: false));
    });

    textController.clear();
  }
}
