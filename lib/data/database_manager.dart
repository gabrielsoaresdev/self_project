import 'package:self_codinome/model/field.dart';
import 'package:self_codinome/model/self_evaluation.dart';
import 'package:self_codinome/model/sphere.dart';

class DatabaseManager {
  bool saveSelfEvaluation(SelfEvaluation selfEvaluation) {
    return false;
  }

  SelfEvaluation getLastSelfEvaluation() {
    return new SelfEvaluation(
        date: new DateTime(2020),
        tags: [],
        comments: '*',
        spheres: [
          Sphere(
            name: 'Relacionamentos',
            imageUri: '/',
            fields: [
              Field(name: 'Familiar', evaluation: 4, comments: '*'),
              Field(name: 'Amoroso', evaluation: 5, comments: '*'),
              Field(name: 'Social', evaluation: 8, comments: '*'),
            ],
          ),
          Sphere(
            name: 'Profissional',
            imageUri: '/',
            fields: [
              Field(name: 'Realização e propósito', evaluation: 2, comments: '*'),
              Field(name: 'Recursos Financeiros', evaluation: 8, comments: '*'),
              Field(name: 'Contribuição Social', evaluation: 7, comments: '*'),
            ],
          ),
          Sphere(
            name: 'Qualidade de vida',
            imageUri: '/',
            fields: [
              Field(name: 'Criatividade, Hobbies e Diversão', evaluation: 3, comments: '*'),
              Field(name: 'Plenitude e Felicidade', evaluation: 6, comments: '*'),
              Field(name: 'Espiritualidade', evaluation: 10, comments: '*'),
            ]),
            Sphere(
            name: 'Pessoal',
            imageUri: '/',
            fields: [
              Field(name: 'Saúde e Disposição', evaluation: 8, comments: '*'),
              Field(name: 'Desenvolvimento Intelectual', evaluation: 9, comments: '*'),
              Field(name: 'Equilíbrio Emocional', evaluation: 10, comments: '*'),
            ]),
        ]);
  }
}
