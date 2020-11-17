import 'package:counter_app/src/view.dart';

// This is the 'View' of the application. The 'look and feel' of the app.
class MyView extends AppState {
  factory MyView() => _this ??= MyView._();
  MyView._()
      : super(
          debugShowCheckedModeBanner: false,
          switchUI: Prefs.getBool('switchUI'),
          home: HomePage(),
        );
  static MyView _this;

  @override
  void reassemble() {
    super.reassemble();
    // Allow for 'hot reload'
    _this = null;
  }
}
