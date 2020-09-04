import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/res/strings.dart';
import 'package:self_codinome/widgets/text_input_dialog.dart';

class FieldItem extends StatefulWidget {
  _FieldItemState _fieldItemState;
 
  FieldItem({@required Field field, @required Function onDeletePressed}) {
    _fieldItemState =
        new _FieldItemState(field, onDeletePressed: onDeletePressed);
  }

  @override
  _FieldItemState createState() => _fieldItemState;
}

enum _FieldItemMenuOptions { edit, delete }

class _FieldItemState extends State<FieldItem> {
  Field _field;
  Function _onDeletePressed;

  _FieldItemState(this._field, {@required Function onDeletePressed})
      : _onDeletePressed = onDeletePressed;

  Widget _getEvaluationSlider() => Slider(
        value: _field.getEvaluation(),
        min: 0,
        max: 10,
        divisions: 10,
        label: _field.getEvaluation().round().toString(),
        onChanged: (double value) => {
          setState(() {
            _field.setEvaluation(value);
          }),
        },
      );

  Widget _getCommentIconButton(BuildContext context) => IconButton(
        icon: Icon(Icons.message),
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => _getCommentFieldDialog(),
          );
        },
      );

  Widget _getCommentFieldDialog() => TextInputDialog(
        (String typedText) {
          _field.setComments(typedText);
        },
        title: Strings.ADD_FIELD_COMMENT_INPUT +
            _field.getEvaluation().round().toString() +
            '!',
        hint: Strings.ADD_FIELD_COMMENT_INPUT_HINT,
        initText: _field.getComments(),
      );

  Widget _getEditFieldNameDialog() => TextInputDialog(
        (String typedText) {
          _field.setName(typedText);
        },
        title: Strings.FIELD_TYPE_FIELD_NAME,
        initText: _field.getName(),
      );

  Widget _getPopupOptionMenu(BuildContext context) =>
      PopupMenuButton<_FieldItemMenuOptions>(
        onSelected: (_FieldItemMenuOptions result) {
          switch (result) {
            case _FieldItemMenuOptions.delete:
              _onDeletePressed();
              break;
            case _FieldItemMenuOptions.edit:
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => TextInputDialog(
                  (String typedText) {
                    setState(() {
                      _field.setName(typedText);
                    });
                  },
                  title: Strings.FIELD_TYPE_FIELD_NAME,
                  initText: _field.getName(),
                ),
              );
              break;
          }
        },
        itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<_FieldItemMenuOptions>>[
          const PopupMenuItem<_FieldItemMenuOptions>(
            value: _FieldItemMenuOptions.edit,
            child: Text('Editar'),
          ),
          const PopupMenuItem<_FieldItemMenuOptions>(
            value: _FieldItemMenuOptions.delete,
            child: Text('Deletar'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Text(_field.getName()),
            flex: 5,
          ),
          Expanded(
            child: _getEvaluationSlider(),
            flex: 12,
          ),
          Expanded(
            child: _getCommentIconButton(context),
            flex: 2,
          ),
          Expanded(
            child: _getPopupOptionMenu(context),
            flex: 2,
          )
        ],
      ),
    );
  }
}
