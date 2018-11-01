import 'package:flutter/material.dart';
import 'package:myersplash_flutter/list_factory.dart';
import 'package:myersplash_flutter/list_service.dart';
import 'package:myersplash_flutter/model/unsplash_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

typedef void OnTapPhoto(UnsplashImage image);

class PhotoList extends StatefulWidget {
  final OnTapPhoto onTap;
  final int _category;
  final String param;

  PhotoList(this._category, {@required this.onTap, this.param});

  ListService _createService() {
    return ListFactory.create(_category, param);
  }

  @override
  State<StatefulWidget> createState() =>
      _ListState(_createService(), onTapPhoto: onTap);
}

class _ListState extends State<PhotoList> {
  final OnTapPhoto onTapPhoto;
  final ListService _listService;

  _ListState(this._listService, {@required this.onTapPhoto});

  @override
  Widget build(BuildContext context) {
//    if (_listService is PhotoListService) {
//      return new Container(
//          child: new Center(
//              child: new Text(
//        "NO ITEMS",
//        style: TextStyle(
//            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
//      )));
//    }

    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(itemBuilder: (context, i) {
          return FutureBuilder(
              future: _listService.populateList(i),
              builder: (context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Text('Press button to start.');
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Text('Awaiting result...');
                  case ConnectionState.done:
                    if (snapshot.hasError){
                      return Text('Error: ${snapshot.error}');
                    }else{
                      final image = _listService.get(i);

                      if (image == null) {
                        return Text("No item");
                      }

                      return Container(
                          color: image.fromUnsplash
                              ? (i % 2 == 0 ? Colors.white24 : Colors.black)
                              : Colors.white,
                          child: InkWell(
                            onTap: () {
                              onTapPhoto(image);
                            },
                            child: AspectRatio(
                                aspectRatio: 3 / 2.0,
                                child: CachedNetworkImage(imageUrl: image.url)),
                          ));
                    }));
                    }
                }
              });
  }
}
