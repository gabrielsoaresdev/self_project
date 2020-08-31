import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/model/sphere.dart';
import 'package:self_codinome/res/strings.dart';
import 'package:self_codinome/widgets/add_field_dialog.dart';
import 'package:self_codinome/widgets/field_item_widget.dart';

class SphereItem extends StatefulWidget {
  Sphere _sphere;

  SphereItem(Sphere this._sphere);

  @override
  _SphereItemState createState() => _SphereItemState(_sphere);
}

class _SphereItemState extends State<SphereItem> {
  Sphere _sphere;

  _SphereItemState(Sphere this._sphere);

  Widget getHeader(BuildContext context) => Container(
        color: Colors.purple,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Text(
                _sphere.getName(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      );

  Widget getBody(BuildContext context) {
    List<Widget> fields = [];
    for (Field field in _sphere.getFields()) {
      fields.add(FieldItem(field));
    }

    //Creates the 'Add new Field' Button to the Sphere Body
    fields.add(
      FlatButton(
        child: Text('Add new'),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => TextInputDialog((String typedText) {
              setState(() {
                _sphere.getFields().add(new Field(comments: '', name: typedText, evaluation: 0));
              });
            }, title: Strings.ADD_FIELD_TYPE_FIELD, hint: 'Digite aqui',),
          );
        },
      ),
    );

    return Container(
        child: Column(
      children: fields,
    ));
  }

  Future<void> _showMyDialog(BuildContext buildContext) async {
    return showDialog<void>(
      context: buildContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        getHeader(context),
        getBody(context),
      ],
    ));
  }
}
