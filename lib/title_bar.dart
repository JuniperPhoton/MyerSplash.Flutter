import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  int selectedIndex = 1;
  OnClickTitle onClickTitle = null;
  final double barHeight = 66.0;
  final double iconHeight = 24.0;

  TitleBar(this.onClickTitle, this.selectedIndex) {
  }

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    final TextStyle _titleTextStyle = new TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0);

    final EdgeInsets _titlePadding = new EdgeInsets.symmetric(
        vertical: 0.0, horizontal: 8.0);

    const List<String> _titles = const <String>["FEATURED", "NEW", "RANDOM"];

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
                    child: new Text(_titles[index], style: _titleTextStyle)
                ),
                padding: _titlePadding
            )
        ),
      );
    }

    return new Container(
        padding: new EdgeInsets.only(top: _statusBarHeight),
        height: barHeight + _statusBarHeight,
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Image.asset(
                  'images/logo_raw.png', width: iconHeight, height: iconHeight),
              margin: new EdgeInsets.symmetric(horizontal: 12.0),
              height: barHeight,
            ),
            new Center(
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _createTitleWidget(0),
                    _createTitleWidget(1),
                    _createTitleWidget(2)
                  ],
                )
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: new Container(
                child: new Opacity(opacity: 0.5,
                  child: new IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.white70),
                      onPressed: null),
                ),
                margin: new EdgeInsets.symmetric(horizontal: 12.0),
                height: barHeight,
              ),
            )
          ],
        ),
        decoration: new BoxDecoration(
            color: Colors.black
        )
    );
  }
}

typedef void OnClickTitle(int index);