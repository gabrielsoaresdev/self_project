import 'package:flutter/material.dart';
import 'package:self_codinome/model/Field.dart';

class Sphere {
  String _name;
  String _imageURI;
  bool _active;
  List<Field> _fields;

  Sphere (this._name, this._imageURI, this._active, this._fields);

  String getName() => _name;
  String getImageURI() => _imageURI;
  bool isActive() => _active;
  List<Field> getFields() => _fields;

  void setName(String name) => _name = name;
  void setImageUri(String uri) => _imageURI = uri;
  void setActive(bool active) => _active = active;
  void setFields(List<Field> fields) => _fields = fields;
}