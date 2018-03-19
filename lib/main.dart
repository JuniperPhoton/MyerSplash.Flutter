import 'package:flutter/material.dart';
import 'app_color.dart';
import 'title_bar.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyerSplash',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
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
  int _selectedIndex = 1;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(
        length: 3,
        vsync: this,
        initialIndex: _selectedIndex);
    _controller.addListener(() {
      _handleOnClickTitle(_controller.index);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onPressedFAB() {
  }

  void _handleOnClickTitle(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller?.animateTo(index);
  }

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
                      new Container(
                        color: Colors.red,
                        child: new Text("FEATURED"),
                      ),
                      new Container(
                        color: Colors.green,
                        child: new Text("NEW"),
                      ),
                      new Container(
                        color: Colors.blue,
                        child: new Text("RANDOM"),
                      ),
                    ],
                  )
              )
            ],
          )
      ),
      backgroundColor: Colors.black,
      floatingActionButton: new FloatingActionButton(
        onPressed: _onPressedFAB,
        tooltip: 'Search images',
        child: new Icon(Icons.search, color: Colors.white),
      ), // This trailing comma makes auto-formatting nicer for build methods.,
    );
  }
}
