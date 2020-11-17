
import 'package:counter_app/src/view.dart';

/// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title = 'Flutter Demo Home Page'})
      : super(key: key);
  final String title;
  @override
  State createState() =>
      // ignore: no_logic_in_create_state
      App.useMaterial ? HomePageAndroidState() : HomePageiOS();
}
