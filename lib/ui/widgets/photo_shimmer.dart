import 'package:flutter/material.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:shimmer/shimmer.dart';

class PhotoShimmer extends StatefulWidget {
  @override
  _PhotoShimmerState createState() => _PhotoShimmerState();
}

class _PhotoShimmerState extends State<PhotoShimmer> {
  double _screenWidth;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Shimmer.fromColors(
        baseColor: SHIMMER_HIGHLIGHT_COLOR,
        highlightColor: SHIMMER_BASE_COLOR,
        child: Column(
          children: <Widget>[
            Container(
              width: _screenWidth,
              height: _screenWidth / 16 * 9,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(DEFAULT_RADIUS),
                ),
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(DEFAULT_RADIUS)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20.0,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 4),
                        width: _screenWidth / 3,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 20.0,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      CircleAvatar(
                        radius: 20.0,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
