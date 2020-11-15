import 'package:counter_app/src/view.dart' hide HomePage;

import 'package:counter_app/src/home/view/my_first_flutter_app.dart';

import 'package:counter_app/src/controller.dart';

import 'package:counter_app/src/home/model/english_words.dart';

class RandomWordsAndroid extends StateMVC<HomePage> {
  //
  RandomWordsAndroid() : super(Controller()) {
    con = controller;
  }
  Controller con;

  void initState() {
    super.initState();
    add(widget.model);
    model = widget.model;
  }

  Model model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.switch_right_sharp), onPressed: con.leading),
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return Divider();
            model.build(i);
            return ListTile(
              title: Text(
                model.current.asPascalCase,
                style: const TextStyle(fontSize: 25.0),
              ),
              trailing: model.icon,
              onTap: () {
                setState(() {
                  model.onTap(i);
                });
              },
              // onTap: () {
              //   model.onTap(i);
              // },
            );
          }),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = model.tiles();
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
