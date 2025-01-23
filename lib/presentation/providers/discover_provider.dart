import 'package:flutter/material.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, Datasource

  final VideoPostRepository videosRepository;
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;

    // TODO: implement loadNextPage

    notifyListeners();
  }
}
