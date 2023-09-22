import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leading_page/src/constants/constants_app.dart';
import 'package:leading_page/src/core/rest_client/rest_client.dart';
import 'package:video_player/video_player.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LeadingPageState createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  final Uri _url = Uri.parse(
      'https://pay.hotmart.com/I84433402K?checkoutMode=10&bid=1692725119039');
  late VideoPlayerController _controller;
  bool videoEnd = false;
  final RestClient restClient = RestClient();

  void videoDurationEnd(Duration time) {
    Future.delayed(
      time,
      () {
        setState(() {
          videoEnd = true;
        });
      },
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(
      _url,
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $_url');
    }
  }

  void videoPlay() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _controller.setVolume(0);
        _controller.play();
        _controller.setLooping(false);
        Future.delayed(
          const Duration(seconds: 1),
          () {
            _controller.setVolume(1);
          },
        );
      });
    });
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(VideosConstants.video1);

    _controller.initialize().then((value) {
      videoPlay();
      videoDurationEnd(_controller.value.duration);
      setState(() {});
    });
    restClient.post("views-counter");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesConstants.backgroudImage),
            opacity: 0.3,
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cabeçalho",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: GoogleFonts.nanumMyeongjo(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _controller.value.isInitialized
                            ? SizedBox(
                                height: 500,
                                width: 700,
                                child: VideoPlayer(_controller),
                              )
                            : const SizedBox(
                                height: 500,
                                width: 700,
                              ),
                        videoEnd
                            ? SizedBox(
                                height: 200,
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _launchUrl();
                                      restClient.post("click-counter");
                                    },
                                    child: const Text(
                                      "Link para compra",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 200,
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
