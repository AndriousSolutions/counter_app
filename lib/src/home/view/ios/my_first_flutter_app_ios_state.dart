import 'package:counter_app/src/view.dart' hide HomePage;

import 'package:counter_app/src/home/view/my_first_flutter_app.dart';

import 'package:counter_app/src/controller.dart';

import 'package:counter_app/src/home/model/english_words.dart';

class RandomWordsiOS extends StateMVC<HomePage> {
  //
  RandomWordsiOS() : super(Controller()) {
    con = controller;
  }
  Controller con;

  @override
  void initState() {
    super.initState();
    add(widget.model);
    model = widget.model;
  }

  Model model;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(widget.title),
            leading: CupertinoButton(
              onPressed: con.leading,
              child: const Icon(Icons.switch_left_sharp),
            ),
            trailing: CupertinoButton(
              onPressed: _pushSaved,
              child: const Icon(Icons.list),
            ),
          ),
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  if (i.isOdd) {
                    return const Divider();
                  }
                  model.build(i);
                  return _CupertinoListTile(
                    title: model.current.asPascalCase,
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
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      CupertinoPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<Widget> tiles = model.tiles();
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();
          final Iterator<Widget> it = divided.iterator;
          return CupertinoPageScaffold(
            child: CustomScrollView(
              slivers: <Widget>[
                const CupertinoSliverNavigationBar(
                  largeTitle: Text('Saved Suggestions'),
                ),
                SliverSafeArea(
                  top: false,
                  minimum: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        if (i.isOdd) {
                          return const Divider();
                        }
                        it.moveNext();
                        return _CupertinoListTile(
                          title: model.current.asPascalCase,
                        );
                      },
                      childCount: divided.length,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Cupertino needs a ListTile equivalent
/// https://github.com/flutter/flutter/issues/50668
class _CupertinoListTile extends StatefulWidget {
  const _CupertinoListTile({
    Key key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final Function onTap;
  @override
  _StatefulStateCupertino createState() => _StatefulStateCupertino();
}

class _StatefulStateCupertino extends State<_CupertinoListTile> {
  @override
  Widget build(BuildContext context) {
    Widget leading;
    if (widget.leading == null) {
      leading = const SizedBox();
    } else {
      leading = widget.leading;
    }
    Widget trailing;
    if (widget.trailing == null) {
      trailing = const SizedBox();
    } else {
      trailing = widget.trailing;
    }
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              leading,
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnChildren(context),
              ),
            ],
          ),
          trailing,
        ],
      ),
    );
  }

  List<Widget> columnChildren(BuildContext context) {
    final List<Widget> children = []; // was List();
//    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Widget title = widget.title != null
        ? Text(
            widget.title,
            style: TextStyle(
                fontSize: 25, color: isDark ? Colors.white : Colors.black),
          )
        : const SizedBox();
    children.add(title);
    if (widget.subtitle != null) {
      children.add(Text(widget.subtitle,
          style: const TextStyle(color: CupertinoColors.systemGrey)));
    }
    return children;
  }
}
