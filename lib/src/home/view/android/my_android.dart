
import 'package:counter_app/src/view.dart' hide HomePage;

import 'package:counter_app/src/home/view/my_home.dart';

import 'package:counter_app/src/controller.dart';

/// View
class HomePageAndroidState extends StateMVC<HomePage> {
  // Constructor registers a Controller
  HomePageAndroidState() : super(Controller()) {
    con = controller;
  }
  Controller con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: const Icon(Icons.switch_right_sharp), onPressed: con.leading),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              con.data,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //        onPressed: con.onPressed
        onPressed: () {
          setState(() {
            con.onPressed();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
