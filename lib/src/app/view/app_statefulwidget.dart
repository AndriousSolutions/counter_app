
import 'package:counter_app/src/view.dart';

/// App
class MyApp extends AppStatefulWidget {
  factory MyApp({Key key}) => _this ??= MyApp._(key);
  MyApp._(Key key) : super(key: key);
  static MyApp _this;
  @override
  AppState createView() => MyView();
}