import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteramazingiamges/constants/index.dart';
import 'package:flutteramazingiamges/constants/measure.dart';
import 'package:flutteramazingiamges/mvp/models/index.dart';

// ignore: non_constant_identifier_names
Card DisplayBasicInfoOfPhoto(Photo photo) {
  final _fontDefault = DEFAULT_UN_SELECTED_ICON;
  return Card(
    margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
    child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(DEFAULT_RADIUS),
            ),
            child: CachedNetworkImage(
              imageUrl: photo.src.large2X,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          height: 44,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 16.0,
                    backgroundImage: NetworkImage(photo.src.tiny),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '${photo.photographer}',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: _fontDefault,
                        letterSpacing: 2),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/icons/plus-circle-outline.svg',
                    color: _fontDefault,
                  ),
                  SizedBox(width: 6),
                  SvgPicture.asset(
                    'assets/icons/heart-outline.svg',
                    color: _fontDefault,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}