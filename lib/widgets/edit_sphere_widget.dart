import 'package:flutter/material.dart';
import 'package:self_codinome/model/sphere.dart';
import 'package:self_codinome/res/strings.dart';

class EditSphereDialog extends StatelessWidget {
  final Sphere _sphere;

  EditSphereDialog({@required Sphere sphere}) : this._sphere = sphere;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Strings.ADD_SPHERE_INFO),
      content: EditSphereWidget(_sphere),
      actions: [
        FlatButton(
          child: Text(Strings.CANCEL),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text(Strings.SAVE),
          onPressed: null,
        ),
      ],
    );
  }
}

class EditSphereWidget extends StatefulWidget {
  final Sphere _sphere;

  EditSphereWidget(Sphere sphere) : this._sphere = sphere;

  @override
  _EditSphereWidgetState createState() =>
      _EditSphereWidgetState(sphere: _sphere);
}

class _EditSphereWidgetState extends State<EditSphereWidget> {
  Sphere _sphere;
  TextEditingController _controller;
  bool _ableToSave;

  _EditSphereWidgetState({@required Sphere sphere}) {
    this._sphere = sphere;
    _controller = new TextEditingController();
    _controller.text = sphere.getName();
  }

  Widget getInputTextField() => new TextField(
        autofocus: true,
        decoration: InputDecoration(labelText: Strings.ADD_SPHERE_INPUT_NAME),
        controller: _controller,
        onChanged: (value) {
          if (_controller.text.trim().length == 0 && _ableToSave) {
            setState(() {
              _ableToSave = false;
            });
          } else if (_controller.text.trim().length > 0 && !_ableToSave) {
            setState(() {
              _ableToSave = true;
            });
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: getInputTextField()),
        Expanded(child:  Text(Strings.ADD_SPHERE_INPUT_COLOR),),
        Expanded(
          child: Row(
            children: [
              Expanded(child: RaisedButton()),
              Expanded(child: RaisedButton()),
              Expanded(child: RaisedButton()),
              Expanded(child: RaisedButton()),
              Expanded(child: RaisedButton()),
            ],
          ),
        )
      ],
    );
  }
}
