import 'package:flutter/material.dart';

sealed class ImagesConstants {
  static const backgroudImage = "assets/images/boca.jpg";
}

sealed class VideosConstants {
  static const video1 = "assets/videos/video1.mp4";
}

sealed class UrlConstantes {
  final baseUrl = "https://parseapi.back4app.com/functions/views-counter";
  static const header = {
    "X-Parse-Application-Id": "Xp2HHANDXltmDXHaFESVovJro8SjDZP7UK5NxiSb",
    "X-Parse-REST-API-Key": "xZmN7UO5j0v5uLGUn5rSsZD6Tl0xtkUKNVkiqqBw",
    "Content-Type": "application/json",
  };
}

sealed class LeadingPageTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    ),
  );
}
