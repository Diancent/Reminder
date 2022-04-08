import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reminder/models/todo_model.dart';
import 'package:reminder/widgets/custom_checkbox.dart';
import 'package:reminder/widgets/widgets.dart';

class BottomList extends StatefulWidget {
  const BottomList({Key? key}) : super(key: key);

  @override
  State<BottomList> createState() => _BottomListState();
}

class _BottomListState extends State<BottomList> {
  final List<TodoItem> todoList = <TodoItem>[];
  final Random random = Random();
  // final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      width: 300,
      height: 439,
      child: ListView(
        //shrinkWrap: true, //////////
        children: List.generate(todoList.length, (index) {
          final item = todoList[index];
          return Dismissible(
            key: ObjectKey(todoList[index]),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            background: Container(
              color: Color.fromRGBO(236, 80, 96, 1),
            ),
            // child: TodoTile(
            //   title: 'asdsadasd',
            //   icon: Icon(
            //     Icons.check_box_outline_blank,
            //     //size: 21,
            //   ),
            //   iconSize: 21,
            // ),
            // child: CheckboxListTile(
            //   value: item.checked,
            //   tristate: false,
            //   onChanged: (bool? value) {
            //     var element = item.copyWith(checked: value == true);

            //     setState(() => todoList[index] = element);
            //   },
            //   controlAffinity: ListTileControlAffinity.leading,
            //   activeColor: Color.fromRGBO(87, 203, 134, 1),
            //   title: Text(item.title),
            //   subtitle: Text(
            //     'Lorem ipsum',
            //     style: TextStyle(fontSize: 12),
            //   ),
            //   secondary: Text(
            //     '3pm',
            //     style: TextStyle(
            //       fontSize: 12,
            //       color: Color.fromRGBO(145, 145, 145, 1),
            //     ),
            //   ),
            // ),
            child: ListTile(
              leading: CustomCheckbox(
                type: GFCheckboxType.circle,
                activeBorderColor: Color.fromRGBO(82, 145, 103, 1),
                size: 20,
                activeBgColor: Color.fromRGBO(80, 207, 127, 1),
                // activeIcon: Image.asset(
                //   "assets/icons/check.png",
                //   //color: Color.fromRGBO(39, 38, 44, 1),
                //   //height: 40,
                // ),
                activeIcon: Icon(
                  Icons.check_rounded,
                  size: 11,
                  color: Colors.white,
                ),

                value: item.checked,
                onChanged: (bool? value) {
                  var element = item.copyWith(checked: value == true);

                  setState(() => todoList[index] = element);
                },
                inactiveIcon: Image.asset(
                  "assets/icons/hourglass1.png",
                  //color: Color.fromRGBO(39, 38, 44, 1),
                  //height: 40,
                ),
                inactiveBgColor: Colors.white,
                inactiveBorderColor: Colors.white,
              ),
              title: Text(item.title),
              subtitle: Text(
                'Lorem ipsum',
                style: TextStyle(fontSize: 11),
              ),
              trailing: Text(
                randomNumber + "pm",
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromRGBO(145, 145, 145, 1),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  dynamic get randomNumber {
    int randomNumber = random.nextInt(12) + 1;
    final String stringNumber = randomNumber.toString();
    return stringNumber;
  }

  // Future<dynamic> dialogAdd(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Додайте задачу до свого списку'),
  //         content: TextField(
  //           controller: textController,
  //           decoration: InputDecoration(labelText: 'Введіть задачу'),
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //               addItemToList(textController.text);
  //             },
  //             child: Text('Add'),
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
  //             ),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //             style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all<Color>(
  //                 Color.fromRGBO(236, 80, 96, 1),
  //               ),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void addItemToList(String title) {
  //   setState(() {
  //     todoList.add(TodoItem(title: title, checked: false));
  //   });

  //   textController.clear();
  // }
}
