import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/model/sphere.dart';
import 'package:self_codinome/res/strings.dart';
import 'package:self_codinome/widgets/edit_sphere_widget.dart';
import 'package:self_codinome/widgets/text_input_dialog.dart';
import 'package:self_codinome/widgets/field_item_widget.dart';

enum _SphereMenuOptions { edit, delete }

/* [SphereItem] class is a Widget that seeks to display and manipulate
 * information from a sphere. It's a [Container] divided in two parts: Header and Body.
 * 
 */
class SphereItem extends StatefulWidget {
  final Sphere _sphere;
  final Function _onDeletePressed;
  SphereItem(Sphere sphere, {@required Function onDeletePressed})
      : _sphere = sphere,
        _onDeletePressed = onDeletePressed;

  @override
  _SphereItemState createState() => _SphereItemState(_sphere, _onDeletePressed);
}

class _SphereItemState extends State<SphereItem> {
  Sphere _sphere;
  Function _onDeletePressed;
  _SphereItemState(this._sphere, this._onDeletePressed);

  /* Builds the header of the [Sphere]. The header is composed by a Image 
   * in the background, a h2 Text with the name of the sphere. It's also contains
   * a Show/Hide Button (>/v) and a option menu [_getHeadPopupMenu].
   */
  Widget _getHeader(BuildContext context) => Container(
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
              _getHeadPopupMenu(context),
            ],
          ),
        ),
      );

  Widget _getHeadPopupMenu(BuildContext context) =>
      PopupMenuButton<_SphereMenuOptions>(
        onSelected: (_SphereMenuOptions result) {
          switch (result) {
            case _SphereMenuOptions.edit:
              showDialog(
                context: context,
                builder: (context) => EditSphereDialog(sphere: _sphere),
                barrierDismissible: true,
              );
              break;
            case _SphereMenuOptions.delete:
              _onDeletePressed();
              break;
          }
        },
        itemBuilder: (context) => <PopupMenuEntry<_SphereMenuOptions>>[
          PopupMenuItem<_SphereMenuOptions>(
            value: _SphereMenuOptions.edit,
            child: Text(Strings.EDIT),
          ),
          PopupMenuItem<_SphereMenuOptions>(
            value: _SphereMenuOptions.delete,
            child: Text(Strings.DELETE),
          ),
        ],
      );

  /* Creates the body widget of the Sphere. The body is composed by a list of widgets.
   * Each widget of the list is a [FieldWidget], with the exception of the last one,
   * wich is a button to open a Dialog and add another [Field] to the [Sphere] object.
   */
  Widget _getBody(BuildContext context) {
    List<Widget> fields = [];
    for (Field field in _sphere.getFields()) {
      fields.add(FieldItem(
        field: field,
        onDeletePressed: () {
          setState(() {
            _sphere.getFields().remove(field);
          });
        },
      ));
    }

    //Creates the 'Add new Field' Button to the Sphere Body
    fields.add(_getAddFieldButton(context));

    return Container(
        child: Column(
      children: fields,
    ));
  }

  Widget _getAddFieldButton(BuildContext context) => FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(Strings.ADD_FIELD_ADD_NEW_BUTTON),
          ],
        ),
        padding: EdgeInsets.all(13),
        textColor: Theme.of(context).accentColor,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => _getAddFieldDialog(context),
          );
        },
      );

  TextInputDialog _getAddFieldDialog(BuildContext context) => TextInputDialog(
        (String typedText) {
          setState(() {
            _sphere
                .getFields()
                .add(new Field(comments: '', name: typedText, evaluation: 0));
          });
        },
        title: Strings.FIELD_TYPE_FIELD_NAME,
      );

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        _getHeader(context),
        _getBody(context),
      ],
    ));
  }
}
