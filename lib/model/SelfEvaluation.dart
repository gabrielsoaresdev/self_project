import 'package:self_codinome/model/Sphere.dart';

class SelfEvaluation {
  DateTime _date;
  List<String> _tags;
  String _comments;
  List<Sphere> _spheres;

  SelfEvaluation (this._date, this._tags, this._comments, this._spheres);

  DateTime getDate() => _date;
  List <String> getTags() => _tags;
  String getComments() => _comments;
  List<Sphere> getSpheres() => _spheres;

  void setDate(DateTime date) => _date = date;
  void setCommentsjjjjj(String comments) => _comments = comments;
}