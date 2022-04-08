import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40),
      child: DottedLine(
        dashColor: Color.fromRGBO(239, 239, 239, 1),
        lineLength: 394,
        direction: Axis.vertical,
        lineThickness: 2,
        dashLength: 2,
        dashGapLength: 2,
        dashRadius: 30,
      ),
    );
  }
}
