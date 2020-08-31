import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';

class FieldItem extends StatelessWidget {
  Field _field;

  FieldItem (this._field);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [Text(_field.getName())],)
    );
  }
}