import 'package:counter_app/src/home/model/english_words.dart';

import 'package:counter_app/src/view.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    this.title = 'Startup Name Generator',
  })  : model = Model(),
        super(key: key);
  final model;
  final String title;
  @override
  State createState() =>
      App.useMaterial ? RandomWordsAndroid() : RandomWordsiOS();
}

