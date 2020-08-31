import 'package:flutter/material.dart';
import 'package:self_codinome/data/database_manager.dart';
import 'package:self_codinome/model/self_evaluation.dart';
import 'package:self_codinome/res/strings.dart';
import 'package:self_codinome/widgets/sphere_item_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int position) =>
            getListViewItem(position),
        itemCount: selfEvaluation.getSpheres().length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
      ),
    );
  }
}
