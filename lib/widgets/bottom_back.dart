import 'package:flutter/material.dart';
import 'package:reminder/widgets/bottom_list.dart';
import 'package:reminder/widgets/widgets.dart';

class BottomBack extends StatelessWidget {
  const BottomBack({Key? key}) : super(key: key);
  // final bottomList;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            children: [VerticalLine(), BottomList()],
          )),
    );
  }
}
