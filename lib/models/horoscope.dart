class ZodiacSign {
  String _name;
  String _date;
  String _details;
  String _smallImage;
  String _largeImage;

  ZodiacSign(this._name, this._date, this._details, this._smallImage,
      this._largeImage);

  String get largeImage => _largeImage;

  set largeImage(String value) {
    _largeImage = value;
  }

  String get smallImage => _smallImage;

  set smallImage(String value) {
    _smallImage = value;
  }

  String get details => _details;

  set details(String value) {
    _details = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}
