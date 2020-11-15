import 'package:counter_app/src/view.dart';

import 'package:counter_app/src/home/view/ios/my_ios.dart';

import 'package:counter_app/src/controller.dart';

class HomePageiOS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
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
          widget = _HomeScreen();
        } else if (index == 1) {
          widget = null;
        }
        return widget;
      },
    );
  }
}

class _HomeScreen extends StatefulWidget {
  _HomeScreen({Key key, this.title}) : super(key: key);

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
      height: 56.0, // in logical pixels
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            con.data,
//            style: Theme.of(context).textTheme.headline4,
          ),
          CupertinoButton(
            child: const Text('Press to Increment'),
            onPressed: (){
              setState(() {
                con.onPressed();
              });
            },
          ),
        ],
      ),
    );
  }
}
