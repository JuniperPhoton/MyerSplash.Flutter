import 'package:flutter/material.dart';
import 'package:myersplash_flutter/list.dart';
import 'package:myersplash_flutter/list_factory.dart';
import 'package:myersplash_flutter/model/unsplash_image.dart';
import 'app_color.dart';
import 'title_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyerSplash',
      theme: new ThemeData(
        primaryColor: AppColor.themeColor,
        primaryColorDark: AppColor.themeColorDark,
        accentColor: AppColor.themeColor,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(length: 3, vsync: this, initialIndex: _selectedIndex);
    _controller.addListener(() {
      _handleOnClickTitle(_controller.index);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onPressedFAB() {}

  void _handleOnClickTitle(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller?.animateTo(index);
  }

  void _onTapPhoto(UnsplashImage image) {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          color: Colors.black,
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new TitleBar(_handleOnClickTitle, _selectedIndex),
              new Expanded(
                  child: new TabBarView(
                controller: _controller,
                children: <Widget>[
                  PhotoList(ListFactory.CATEGORY_PHOTO,
                      param: "/photos?", onTap: _onTapPhoto),
                  PhotoList(ListFactory.CATEGORY_PHOTO, onTap: _onTapPhoto),
                  PhotoList(ListFactory.CATEGORY_HIGHLIGHTS,
                      onTap: _onTapPhoto),
                ],
              ))
            ],
          )),
      backgroundColor: Colors.black,
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressedFAB,
        tooltip: 'Search images',
        backgroundColor: Colors.white,
        child: new Icon(Icons.search, color: Colors.black),
      ), // This trailing comma makes auto-formatting nicer for build methods.,
    );
  }
}
