import 'package:flutter/material.dart';
import 'package:reminder/widgets/bottom_back.dart';
import 'package:reminder/widgets/bottom_list.dart';
import 'package:reminder/widgets/vertical_line.dart';

class BottomPlatform extends StatelessWidget {
  const BottomPlatform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomBack(),
        VerticalLine(),
        //BottomList(),
      ],
    );
  }
}
