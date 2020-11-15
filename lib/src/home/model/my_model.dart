/// Model
class Model {
  factory Model() => _this ??= Model._();
  Model._() {
    _counter = 0;
  }
  static Model _this;
  int _counter;

  String get data => '$_counter';

  void onPressed() => _counter++;
}
