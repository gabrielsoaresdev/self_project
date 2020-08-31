import 'package:flutter/material.dart';
import 'package:self_codinome/model/field.dart';

class Sphere {
  String _name;
  String _imageUri;
  List<Field> _fields;

  Sphere ({@required String name, @required String imageUri,
          @required List<Field> fields}) {
    this._name = name;
    this._imageUri = imageUri;
    this._fields = fields;
  }

  String getName() => _name;
  String getImageUri() => _imageUri;
  List<Field> getFields() => _fields;

  void setName(String name) => _name = name;
  void setImageUri(String uri) => _imageUri = _imageUri;
  void setFields(List<Field> fields) => _fields = fields;
}