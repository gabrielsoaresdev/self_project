import 'package:self_codinome/model/sphere.dart';
import 'package:flutter/foundation.dart';

class SelfEvaluation {
  DateTime _date;
  List<String> _tags;
  String _comments;
  List<Sphere> _spheres;

  SelfEvaluation ({@required DateTime date, @required List<String> tags,
                  @required String comments, @required List<Sphere> spheres}) {
    this._date = date;
    this._tags = tags;
    this._comments = comments;
    this._spheres = spheres;
  }

  DateTime getDate() => _date;
  List <String> getTags() => _tags;
  String getComments() => _comments;
  List<Sphere> getSpheres() => _spheres;

  void setDate(DateTime date) => _date = date;
  void setCommentsjjjjj(String comments) => _comments = comments;
}