import 'package:counter_app/src/view.dart';

import 'package:counter_app/src/controller.dart';

import 'package:english_words/english_words.dart';

class Model extends ControllerMVC {
  factory Model([StateMVC state]) => _this ??= Model._(state);
  Model._(StateMVC state) : super(state) {
    words = _EnglishWords();
    _counter = 0;
    onPressed();
  }
  static Model _this;
  _EnglishWords words;
  int _counter;

  // Supply 'data' to a Text widget
  String get data => words.suggestions[_counter].asPascalCase;

  void onPressed() => words.build(_counter++);

  List<WordPair> get suggestions => words.suggestions;

  Set<WordPair> get saved => words.saved;

  WordPair get current => words.current;

  Icon get icon => words.icon;

  void build(int i) => words.build(i);

  Iterable<Widget> tiles({TextStyle style = const TextStyle(fontSize: 25.0)}) =>
      words.saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: style,
            ),
          );
        },
      );

  void onTap(int i) => words.onTap(i);

  // void onTap(int i) => setState(() {
  //       words.onTap(i);
  //     });
}

class _EnglishWords {
  //
  List<WordPair> get suggestions => _suggestions;
  final _suggestions = <WordPair>[];

  Set<WordPair> get saved => _saved;
  final Set<WordPair> _saved = <WordPair>{};

  int get index => _index;
  int _index;

  void build(int i) {
    _index = (i ~/ 2);
    if (_index >= _suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
  }

  WordPair get current => _suggestions[_index];

  Icon get icon {
    bool alreadySaved = _saved.contains(_suggestions[_index]);
    return Icon(
      alreadySaved ? Icons.favorite : Icons.favorite_border,
      color: alreadySaved ? Colors.red : null,
    );
  }

  void onTap(int i) {
    final int index = (i ~/ 2);
    final WordPair pair = _suggestions[index];
    if (pair == null) return;
    if (_saved.contains(_suggestions[index])) {
      _saved.remove(pair);
    } else {
      _saved.add(pair);
    }
  }
}
