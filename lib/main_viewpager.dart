import 'package:flutter/material.dart';

typedef void OnPageChanged(int index);

class MainViewPager extends StatelessWidget {
  OnPageChanged _onPageSelected;
  int _selectedPage = 0;

  MainViewPager(this._onPageSelected,
      this._selectedPage) {
  }

  selectPage(int index, BuildContext context) {
    TabController controller = DefaultTabController.of(context);
    controller?.animateTo(index);
  }

  _handleTabChanged(TabController tab) {
    if (_onPageSelected != null) {
      _onPageSelected(tab.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("default page index is $_selectedPage");
    return new DefaultTabController(length: 3,
        initialIndex: _selectedPage,
        child: new Scaffold(
            backgroundColor: Colors.black,
            body: new TabBarView(
              children: [
                new Container(
                  color: Colors.red,
                ),
                new Container(
                  color: Colors.green,
                ),
                new Container(
                  color: Colors.blue,
                ),
              ],
            )
        ));
  }
}