import 'package:flutter/material.dart';

typedef void OnClickTitle(int index);

class TitleBar extends StatelessWidget {
  final double barHeight = 46.0;
  final double iconHeight = 24.0;
  final OnClickTitle onClickTitle;

  int selectedIndex = 0;

  TitleBar(this.onClickTitle, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;

    final TextStyle _titleTextStyle = new TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0);

    final EdgeInsets _titlePadding =
        const EdgeInsets.symmetric(horizontal: 8.0);

    const List<String> _titles = const <String>[
      "NEW",
      "FEATURED",
      "HIGHLIGHTS"
    ];

    Widget _createTitleWidget(int index) {
      return new GestureDetector(
        onTap: () {
          if (onClickTitle != null) {
            onClickTitle(index);
          }
        },
        child: new Opacity(
            opacity: index == selectedIndex ? 1.0 : 0.5,
            child: new Container(
                color: Colors.transparent,
                height: barHeight,
                child: new Center(
                    child: new Text(_titles[index], style: _titleTextStyle)),
                padding: _titlePadding)),
      );
    }

    return new Container(
        padding: new EdgeInsets.only(top: _statusBarHeight),
        height: barHeight + _statusBarHeight,
        color: Colors.black,
        child: new Stack(
          children: <Widget>[
            new Align(
              alignment: Alignment.centerLeft,
              child: new Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _createTitleWidget(0),
                      _createTitleWidget(1),
                      _createTitleWidget(2)
                    ],
                  )),
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: new Container(
                child: new Opacity(
                  opacity: 0.5,
                  child: new IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.white70),
                      onPressed: () {}),
                ),
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                height: barHeight,
              ),
            )
          ],
        ));
  }
}
