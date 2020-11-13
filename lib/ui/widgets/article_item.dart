import 'package:flutter/material.dart';
import 'package:frolo/data/protocol/models.dart';
import 'package:frolo/utils/navigator_util.dart';
import 'package:frolo/utils/utils.dart';

import 'likebtn/like_button.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
    this.model, {
    Key key,
    this.labelId,
    this.isHome,
  }) : super(key: key);
  final ReposModel model;
  final String labelId;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        NavigatorUtil.pushWeb(context,
            title: model.title, url: model.link, isHome: isHome);
      },
      child: new Container(
        height: 98,
        padding: EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 15),
        child: Row(
          children: <Widget>[
            new Expanded(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF444444),
                      fontWeight: FontWeight.bold,
                    )),
                new Expanded(
                  flex: 1,
                  child: new Container(),
                ),
                new Row(
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(
                          left: 10, top: 1, right: 10, bottom: 1),
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.green, width: 1),
                          borderRadius: new BorderRadius.vertical(
                              top: Radius.elliptical(3, 3),
                              bottom: Radius.elliptical(3, 3))),
                      child: new Text('公众号',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              letterSpacing: 0,
                              fontSize: 9,
                              color: Colors.green)),
                    ),
                    Text(
                      model.author,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    new Container(
                      margin: EdgeInsets.only(left: 10),
                      child: new Text(
                          Utils.getTimeLine(context, model.publishTime),
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontStyle: FontStyle.italic)),
                    ),
                    new Expanded(flex: 1, child: SizedBox()),
                    new LikeButton(
                      width: 30.0,
                      duration: Duration(milliseconds: 500),
                    ),
                  ],
                ),
              ],
            )),
            new Container(
              margin: EdgeInsets.only(left: 12.0),
              child: new CircleAvatar(
                radius: 42.0,
                backgroundColor: Colors.green,
                child: new Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text(
                    model.superChapterName ?? "文章",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 11.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
