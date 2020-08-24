class Field {
  int _nota;
  int _comments;

  Field(this._nota, this._comments);

  int getNota() => _nota;

  int getComments() => _comments;

  void setNota(int nota) => this._nota = nota;

  void setComments(int comments) => this._comments = comments;
}