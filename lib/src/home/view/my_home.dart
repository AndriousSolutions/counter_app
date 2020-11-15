
import 'package:counter_app/src/view.dart';

import 'package:counter_app/src/controller.dart';

/// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title = 'Flutter Demo Home Page'})
      : super(key: key);
  final String title;
  @override
  State createState() =>
      App.useMaterial ? HomePageAndroidState() : HomePageiOS();
}
