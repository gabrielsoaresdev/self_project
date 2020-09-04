import 'package:flutter/material.dart';
import 'package:self_codinome/res/strings.dart';


class TextInputDialog extends StatefulWidget {
  final _TextInputDialogState _textInputDialogState;

  TextInputDialog(save(String typedText),
    {String title = '', String hint = '', String initText = ''}) :
    _textInputDialogState =
        new _TextInputDialogState(save, title: title, hint: hint, initText: initText);

  @override
  State<StatefulWidget> createState() => _textInputDialogState;
}

class _TextInputDialogState extends State<TextInputDialog> {
  String _title;
  String _hint;
  Function _save;

  TextEditingController controller;

  bool ableToSave = false;

  _TextInputDialogState(this._save, {String title = '', String hint = '', String initText = ''}) {
    this._title = title;
    this._hint = hint;
    print(title);

    controller = new TextEditingController();
    controller.text = initText;
  }

  Widget getInputTextField () => new TextField(
      autofocus: true,
      decoration: InputDecoration(labelText: _hint),
      controller: controller,
      onChanged: (value) {
        if (controller.text.trim().length == 0 && ableToSave) {
          setState(() {
            ableToSave = false;
          });
        }
        else if(controller.text.trim().length > 0 && !ableToSave) {
          setState(() {
            ableToSave = true;
          });
        }
      },
    );

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
      content: getInputTextField(),
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
