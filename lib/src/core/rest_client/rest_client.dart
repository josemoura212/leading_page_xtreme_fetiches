import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

final class RestClient extends DioForBrowser {
  RestClient()
      : super(
          BaseOptions(
              baseUrl: "https://parseapi.back4app.com/functions/",
              headers: {
                "X-Parse-Application-Id":
                    "Xp2HHANDXltmDXHaFESVovJro8SjDZP7UK5NxiSb",
                "X-Parse-REST-API-Key":
                    "xZmN7UO5j0v5uLGUn5rSsZD6Tl0xtkUKNVkiqqBw",
                "Content-Type": "application/json",
              }),
        );

  RestClient get view {
    return this;
  }
}
