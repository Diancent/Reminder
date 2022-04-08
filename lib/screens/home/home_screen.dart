import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reminder/widgets/custom_checkbox.dart';
import 'package:reminder/widgets/widgets.dart';
import 'package:reminder/models/todo_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TodoItem> todoList = <TodoItem>[];
  final TextEditingController textController = TextEditingController();
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    // DraggableScrollableSheet();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              //size: 21,
            ),
            iconSize: 20,
          ),
        ],
        leading: IconButton(
          onPressed: () {
            dialogAdd(context);
            //DialogAdd();
          },
          icon: Image.asset(
            "assets/icons/menu.png",
            color: Color.fromRGBO(39, 38, 44, 1),
            height: 23,
          ),
          // icon: Icon(Icons.menu),
          // color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 35),
              SafeArea(
                left: true,
                right: true,
                child: CarouselList(),
              ),
              SizedBox(height: 20),
              SafeArea(
                left: true,
                right: true,
                child: Padding(
                  padding: EdgeInsets.only(left: 35, right: 35),
                  child: Calendar(),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: 320,
                child: Container(
                  width: double.infinity,
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(184, 184, 184, 1),
                        spreadRadius: 6,
                        blurRadius: 30,
                      )
                    ],
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [VerticalLine(), bottomList()],
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> dialogAdd(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
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
                    Color.fromRGBO(236, 80, 96, 1)),
              ),
            ),
          ],
        );
      },
    );
  }

  void addItemToList(String title) {
    setState(() {
      todoList.add(TodoItem(title: title, checked: false));
    });

    textController.clear();
  }

  Container bottomList() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 15,
      ),
      width: 270,
      height: 394,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(), // без скрола
        children: List.generate(todoList.length, (index) {
          final item = todoList[index];
          return Slidable(
            key: ObjectKey(todoList[index]),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (direction) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  // backgroundColor: Color(0xFF7BC043),
                  // backgroundColor: Color.fromRGBO(236, 80, 96, 1),
                  backgroundColor: Color.fromRGBO(239, 199, 86, 1),
                  foregroundColor: Colors.black,
                  icon: CupertinoIcons.trash,
                  // label: 'Delete',
                ),
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (direction) {},
                  // backgroundColor: Color(0xFF7BC043),
                  // backgroundColor: Color.fromRGBO(236, 80, 96, 1),
                  backgroundColor: Color.fromRGBO(239, 238, 240, 1),
                  foregroundColor: Colors.black,
                  icon: Icons.close,
                  // label: 'Close',
                ),
              ],
            ),
            // onDismissed: (direction) {
            //   setState(() {
            //     todoList.removeAt(index);
            //   });
            // },
            // background: Container(
            //   color: Color.fromRGBO(236, 80, 96, 1),
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
}
