import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myersplash_flutter/app_color.dart';
import 'model/unsplash_image.dart';
import 'util.dart';
import 'dart:io';

class MainList extends StatefulWidget {
  String _path;

  MainList(this._path);

  @override
  State<StatefulWidget> createState() => new MainListState();
}

class MainListState extends State<MainList> {
  final TAG = "MainListStateLog";
  final PER_PAGE = '10';
  final CLIENT_ID = '403d9934ce4bb8dbef44765692144e8c6fac6d2698950cb40b07397d6c6635fe';

  var _items = new List();
  var _page = 1;

  @override
  void initState() {
    super.initState();

    if (_items.length == 0) {
      _getPhotos(true);
    }

    Logger.log(TAG, "init state");
  }

  Future<Null> _getPhotos(bool refresh) async {
    var httpClient = new HttpClient();
    var uri = new Uri.https(
        'api.unsplash.com',
        widget._path,
        {
          'page': _page.toString(),
          'per_pagge': PER_PAGE,
          'client_id': CLIENT_ID,
          'count': "10"
        });

    Logger.log(TAG, "sending request: ${widget._path}");

    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();

    var items = new List<UnsplashImage>();

    List<Map> data = json.decode(responseBody);
    for (int i = 0; i < data.length; i++) {
      var image = new UnsplashImage.fromJson(data[i]);
      items.add(image);
    }

    if (items.isNotEmpty) {
      _page++;
    }

    setState(() {
      if (refresh) {
        _items.clear();
      }
      _items.addAll(items);
    });

    return new Future<Null>.value(null);
  }

  Widget buildFooter() {
    return new Container(
      color: Colors.black,
      height: 100.0,
      child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                  width: 25.0,
                  height: 25.0,
                  margin: new EdgeInsets.symmetric(horizontal: 12.0),
                  child: new CircularProgressIndicator()
              ),
              new Text("LOADING...",
                  style: new TextStyle(color: Colors.white)
              )
            ],
          )),
    );
  }

  int getItemCount() {
    return _items.length + 1;
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      child: new ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          Logger.log(
              TAG, "building item at $index, with current ${_items.length}");

          if (index == getItemCount() - 1) {
            _getPhotos(false);
            return buildFooter();
          } else {
            return new ListItem(_items[index]);
          }
        },
        itemCount: getItemCount(),
        padding: new EdgeInsets.all(0.0),
      ),
      onRefresh: () {
        _getPhotos(true);
      },
    );
  }
}

class ListItem extends StatelessWidget {
  UnsplashImage _image;

  ListItem(this._image);

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 250.0,
        color: parseColor(_image.color),
        child: new Image.network(_image?.urls?.regular, fit: BoxFit.cover)
    );
  }
}