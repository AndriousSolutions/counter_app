import 'package:counter_app/src/view.dart';

// This is the 'View' of the application. The 'look and feel' of the app.
class MyView extends AppState {
  MyView()
      : super(
          debugShowCheckedModeBanner: false,
          switchUI: Prefs.getBool('switchUI'),
          inHome: () => HomePage(key: AppState.homeKey),
        );
}
