import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/res/strings.dart';


class TextInputDialog extends StatefulWidget {
  _TextInputDialogState _textInputDialogState;

  TextInputDialog(Function save,
    {String title = '', String hint = ''}) {
    _textInputDialogState =
        new _TextInputDialogState(save, title: title, hint: hint);
  }

  @override
  State<StatefulWidget> createState() => _textInputDialogState;
}

class _TextInputDialogState extends State<TextInputDialog> {
  String _title;
  String _hint;
  Function _save;

  TextField _dialogTextField;
  TextEditingController controller;

  bool ableToSave = false;

  _TextInputDialogState(this._save, {String title = '', String hint = ''}) {
    controller = new TextEditingController();

    _dialogTextField = new TextField(
      autofocus: true,
      decoration: InputDecoration(labelText: _hint),
      controller: controller,
      onChanged: (value) {
        if (controller.text.trim().isEmpty && controller.text.trim().isEmpty)
          setState(() {
            ableToSave = false;
          });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Function onSavePressed;
    if (ableToSave) {
      onSavePressed = () {
        _save(controller.text);
        Navigator.of(context).pop();
      };
    }

    return AlertDialog(
      title: Text(_title),
      content: _dialogTextField,
      actions: [
        FlatButton(
          child: Text(Strings.CANCEL),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: Text(Strings.SAVE),
          onPressed: onSavePressed,
        ),
      ],
    );
  }
}
