import 'package:flutter/material.dart';
import 'package:self_codinome/data/database_manager.dart';
import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/model/self_evaluation.dart';
import 'package:self_codinome/model/sphere.dart';
import 'package:self_codinome/res/strings.dart';
import 'package:self_codinome/widgets/sphere_item_widget.dart';
import 'package:self_codinome/widgets/text_input_dialog.dart';

class SelfEvaluationScreen extends StatefulWidget {
  @override
  _SelfEvaluationScreenState createState() => _SelfEvaluationScreenState();
}

class _SelfEvaluationScreenState extends State<SelfEvaluationScreen> {
  SelfEvaluation selfEvaluation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selfEvaluation = DatabaseManager().getLastSelfEvaluation();
  }

  Widget getListViewItem(int i) => SphereItem(selfEvaluation.getSpheres()[i]);

  ListView _getListView() => ListView.builder(
        itemBuilder: (BuildContext context, int position) =>
            getListViewItem(position),
        itemCount: selfEvaluation.getSpheres().length,
      );

  TextInputDialog _getAddSphereDialog() => new TextInputDialog(
        (String typedText) {
          setState(() {
            selfEvaluation.getSpheres().add(
                new Sphere(name: typedText, imageUri: '', fields: <Field>[]));
          });
        },
        title: Strings.ADD_SPHERE_TYPE_FIELD,
      );

  IconButton _getIconButton(BuildContext context) => IconButton(
        icon: Icon(Icons.add),
        tooltip: Strings.ADD_SPHERE_TOOLTIP,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => _getAddSphereDialog(),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _getIconButton(context),
        ],
      ),
      body: _getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
