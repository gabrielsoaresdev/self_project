import 'package:flutter/cupertino.dart';

class Field {
  String _name;
  double _evaluation;
  String _comments;

  Field({@required String name, @required double evaluation, @required String comments}) {
    this._name = name;
    this._evaluation = evaluation;
    this._comments = comments;
  }

  String getName() => _name;
  double getEvaluation() => _evaluation;
  String getComments() => _comments;

  void setName(String name) => _name = name;
  void setEvaluation(double evaluation) => this._evaluation = evaluation;
  void setComments(String comments) => this._comments = comments;
}