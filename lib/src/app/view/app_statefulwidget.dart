
import 'package:counter_app/src/view.dart';

/// App
class MyApp extends AppStatefulWidget {
  factory MyApp({Key key}) => _this ??= MyApp._(key);
  MyApp._(Key key) : super(key: key);
  static MyApp _this;
  // This is the 'View' of the application.
  @override
  AppState createView() => MyView();
}