///
/// Controller for the home screen.
///

// You can see 'at a glance' this Controller 'talks to' the Model.
import 'package:counter_app/src/model.dart';

import 'package:counter_app/src/controller.dart';

// You can see 'at a glance' this Controller also 'talks to' the interface (View).
import 'package:counter_app/src/view.dart';

/// extends 'ControllerMVC' so if added to a State object
/// can 'talk to' the View. (i.e. issue a setState() funciton call)
class Controller extends ControllerMVC {
  factory Controller() => _this ??= Controller._();
  Controller._() {
    _model = Model();
  }
  static Controller _this;

  Model _model;

  String get data => _model.data;

  void onPressed() => _model.onPressed();

  // void onPressed() => setState(() {
  //       _model.onPressed();
  //     });

  // Assign to the 'leading' widget on the interface.
  void leading() {
    //
    App.changeUI(App.useMaterial ? 'Cupertino' : 'Material');
    bool switchUI;
    if (App.useMaterial) {
      if (UniversalPlatform.isAndroid) {
        switchUI = false;
      } else {
        switchUI = true;
      }
    } else {
      if (UniversalPlatform.isAndroid) {
        switchUI = true;
      } else {
        switchUI = false;
      }
    }
    Prefs.setBool('switchUI', switchUI);
  }
}
