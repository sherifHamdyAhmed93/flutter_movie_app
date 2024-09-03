import 'package:flutter/material.dart';
import 'package:flutter_movie_app/api_manager/api_manager.dart';
import 'package:flutter_movie_app/my_theme/app_colors.dart';
import 'package:flutter_movie_app/utils.dart';

class PlayButtonWidget extends StatefulWidget {
  PlayButtonWidget({super.key,required this.movieId});
  int movieId;
  bool isloadingVideos = false;

  @override
  State<PlayButtonWidget> createState() => _PlayButtonWidgetState();
}

class _PlayButtonWidgetState extends State<PlayButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: widget.isloadingVideos ?
        CircularProgressIndicator(color: AppColors.gold,) :
        IconButton(
          icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 60),
          onPressed: () {
            getMovieVideo();
          },
        ),
      ),
    );
  }

  Future<void> getMovieVideo()async{
    widget.isloadingVideos = true;
    setState(() {

    });
    var response = await ApiManager.getMovieVideos(widget.movieId);
    widget.isloadingVideos = false;
    setState(() {

    });
    if (response?.results != null){
      String videoURL = response!.results?.first.getVideoUrl() ?? '';
      Utils.launchURL(videoURL);
    }
  }
}