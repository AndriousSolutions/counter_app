import 'package:counter_app/src/view.dart';

/// App
class MyApp extends AppStatefulWidget {
  MyApp({Key key}) : super(key: key);
  // This is the 'View' of the application.
  @override
  AppState createView() => MyView();
}
