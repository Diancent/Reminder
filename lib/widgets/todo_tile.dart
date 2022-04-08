import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    Key? key,
    //this.onChange,
    this.isChecked = false,
    required this.icon,
    //required this.size,
    required this.iconSize,
    //required this.selectedColor,
    required this.title,
    //required this.borderColor,
    //required this.selectedIconColor,
    this.onChanged,
  }) : super(key: key);

  //final Function onChange;
  final bool isChecked;
  final Icon icon;
  //final double size;
  final double iconSize;
  //final Color selectedColor;
  final String title;
  //final Color borderColor;
  //final Color selectedIconColor;
  final ValueChanged<bool>? onChanged;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.isChecked ?? false;
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            //widget.onChange(isSelected);
          });
        },
        child: AnimatedContainer(
          margin: EdgeInsets.all(4),
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
              color: isSelected
                  ? Colors.blue
                  // ? widget.selectedColor ?? Colors.blue
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(
                color: Colors.black,
                // color: widget.borderColor ?? Colors.black,
                width: 1.5,
              )),
          // width: widget.size ?? 18,
          // height: widget.size ?? 18,
          width: 18,
          height: 18,
          child: isSelected
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                  // color: widget.selectedIconColor ?? Colors.white,
                  size: 14,
                  // size: widget.iconSize ?? 14,
                )
              : null,
        ),
      ),
      // leading: Checkbox(

      //   checkColor: Colors.white,
      //   //fillColor: MaterialStateProperty.resolveWith(getColor),
      //   value: isChecked,
      //   onChanged: (bool? value) {
      //     setState(() {
      //       isChecked = value!;
      //     });
      //   },
      //),
      title: Text(widget.title),
      subtitle: Text(
        'Lorem ipsum',
        style: TextStyle(fontSize: 12),
      ),
      // onTap: _handleChange,
      trailing: Text(
        '3pm',
        style: TextStyle(
          fontSize: 12,
          color: Color.fromRGBO(145, 145, 145, 1),
        ),
      ),
      onTap: () => widget.onChanged?.call(!widget.isChecked),
    );
  }
}
