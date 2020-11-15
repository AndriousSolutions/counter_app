import 'package:counter_app/src/view.dart';

import 'package:counter_app/src/controller.dart';

class HomePageiOS extends StateMVC<HomePage> {
  // Constructor registers a Controller
  HomePageiOS() : super(Controller()) {
    con = controller;
  }
  Controller con;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(widget.title),
            leading: CupertinoButton(
              onPressed: con.leading,
              child: const Icon(Icons.switch_left_sharp),
            )),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              label: 'Settings',
            ),
          ]),
          tabBuilder: (_, index) {
            Widget widget;
            if (index == 0) {
              widget = const _HomeScreen();
            } else if (index == 1) {
              widget = null;
            }
            return widget;
          },
        ));
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends StateMVC<_HomeScreen> {
  // Constructor registers a Controller
  _HomeScreenState() : super(Controller()) {
    con = controller;
  }
  Controller con;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // in logical pixels
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            con.data,
//            style: Theme.of(context).textTheme.headline4,
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                con.onPressed();
              });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
