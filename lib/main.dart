
import 'package:counter_app/src/view.dart';

import 'package:counter_app/src/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends StateMVC<MyHomePage> {

  // Use a constructor to register a Controller
  _MyHomePageState(): super(_MyHomePageController()){
    con = controller;
  }
  _MyHomePageController con;

  void onPressed() {
    setState(() {
       con.onPressed();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${con.body}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class _MyHomePageController extends ControllerMVC{


//  _MyHomePageController():super(){
//    model = _MyHomePageModel();
//  }
//  _MyHomePageModel model;

  // An alternative to supplying a constructor for such a simple app.
  _MyHomePageModel model = _MyHomePageModel();

  int get body => model.integer;

  void onPressed() => model._incrementInteger();
}


class _MyHomePageModel{

  int counter = 0;

  int get integer => counter;

  void _incrementInteger() => counter++;
}
