import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/Widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/Widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];
        return Stack(children: [
          // VideoPlayer + gradient
          SizedBox.expand(
            child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl, caption: videoPost.caption),
          ),
          // FullScreenPlayer(videoUrl: videoPost.videoUrl),

          // buttons: likes, comments, share, etc.
          Positioned(
              bottom: 40, right: 10, child: VideoButtons(videoPost: videoPost)),
        ]);
      },
    );
  }
}
