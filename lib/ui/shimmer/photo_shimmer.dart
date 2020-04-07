import 'package:flutter/material.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:shimmer/shimmer.dart';

class PhotoShimmer extends StatelessWidget {
  final screenWidth;

  const PhotoShimmer({Key key, @required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Shimmer.fromColors(
        baseColor: SHIMMER_HIGHLIGHT_COLOR,
        highlightColor: SHIMMER_BASE_COLOR,
        child: Column(
          children: <Widget>[
            Container(
              width: screenWidth,
              height: screenWidth / 16 * 9,
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
                        width: screenWidth / 3,
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
