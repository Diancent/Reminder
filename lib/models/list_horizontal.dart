import 'package:flutter/material.dart';

List firstSwipe = [
  ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    child: Container(
      width: 85,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Center(
        child: Text(
          "+",
          style: TextStyle(
              fontSize: 30.0, color: Color.fromRGBO(211, 211, 211, 1)),
        ),
      ),
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(40)),
    child: Container(
      width: 85,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(235, 186, 23, 1),
        //color: Theme.of(context).primaryColor,

        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Center(
        child: Text(
          "All",
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      ),
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    child: Container(
      width: 85,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Center(
        child: Text(
          "Tasks",
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    ),
  ),
  ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(6)),
    child: Container(
      width: 85,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Center(
        child: Text(
          "Notes",
          style: TextStyle(fontSize: 14.0),
        ),
      ),
    ),
  ),
];
