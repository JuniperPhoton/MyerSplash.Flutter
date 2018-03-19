import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTabController extends StatefulWidget {
  int length = 0;
  int initialIndex = 0;

  Widget child;

  CustomTabController({
    Key key,
    @required this.length,
    this.initialIndex,
    @required this.child}) :super(key: key) {
  }

  @override
  State<StatefulWidget> createState() {
    return new _CustomTabControllerState();
  }
}

class _CustomTabControllerState extends State<CustomTabController>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return new _TabControllerScope();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: widget.length, vsync: this);
  }
}

class _TabControllerScope extends InheritedWidget {
  const _TabControllerScope({
    Key key,
    this.controller,
    this.enabled,
    Widget child
  }) : super(key: key, child: child);

  final TabController controller;
  final bool enabled;

  @override
  bool updateShouldNotify(_TabControllerScope old) {
    return enabled != old.enabled || controller != old.controller;
  }
}