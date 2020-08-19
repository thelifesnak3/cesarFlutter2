import 'package:cesarFlutter/app/common/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class Styles {
    /* -------------------
      SPLASH PAGE STYLES
    ------------------- */
  static TextStyle splashTitle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold);

  static TextStyle splashDescription = TextStyle(
      color: Colors.white70,
      fontSize: 14,
      fontWeight: FontWeight.normal);

  static TextStyle splashGetStart = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold);


  /* -------------------
      HOME PAGE STYLES
    ------------------- */

    static TextStyle homeMusicLabel = TextStyle(
      color: Colors.white,
      fontSize: 28,
      fontWeight: FontWeight.bold);

    static TextStyle homeArtistLabel = TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold);

    static TextStyle homeTrendingLabel = TextStyle(
      fontSize: 10,
      color: Colors.white,
    );

    static TextStyle homePlayLabel = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: AppColors.defaultTextButton,
    );

    static TextStyle homeTitleLabel = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    static TextStyle homeFeaturedTrackTitle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    static TextStyle homeFeaturedTrackArtist = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black45,
    );

    static TextStyle homeTopTrackTitle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );

    static TextStyle homeTopTrackArtist = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    );
}