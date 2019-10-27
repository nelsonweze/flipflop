import 'color.dart' as colors;
import 'package:flip_flop/shared/text.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String thirdline;
  final Widget leading;
  final String uid;
  final String status;

  ListItem(
      {Key key,
      this.imageUrl,
      this.title,
      this.thirdline,
      this.uid,
      this.leading,
      this.status,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Stack(
        children: <Widget>[
          Image.network(
            imageUrl,
            height: 45,
            width: 45,
          ),
          Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: colors.white, width: 1.5),
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))))
                         
        ],
      ),
      Flexible(child: buildFlexContainer(title, subtitle, thirdline))
    ]);
  }

  Container buildFlexContainer(String title, String subtitle, String thirdline) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: NormalText(
            text: title,
            color: colors.black,
            weight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, right: 10.0),
          child: Container(
              child: AppH6Text(
            text: subtitle,
            overflow: TextOverflow.ellipsis,
          )),
        ),
        thirdline != null
            ? Padding(
                padding: const EdgeInsets.only(top: 4.0, right: 10.0),
                child: Container(
                    child: AppPText(
                  text: thirdline,
                  overflow: TextOverflow.ellipsis,
                )),
              )
            : Container(),
        Container(
          padding: EdgeInsets.only(top: 10),
        )
      ],
    ),
    margin: EdgeInsets.only(left: 20.0),
  );
}

}
