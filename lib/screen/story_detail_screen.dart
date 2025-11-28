import 'package:flutter/material.dart';
import 'package:instargram/Provider/app_provider.dart';
import 'package:video_player/video_player.dart';

class StoryDetailScreen extends StatelessWidget {

  const StoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: appProvider.followerStoryList?.length ?? 0,
        itemBuilder: (context, index) {
          final currentStory = appProvider.followerStoryList![index];

          final videoController = currentStory.isVideo ? VideoPlayerController.networkUrl(
            Uri.parse(currentStory.contentUrl)
          ) : null;
          //..을 사용하면 return 될대 값이 안받아와 지고 내부 코드 실행만 됨

          videoController?.initialize().then((value) {
            videoController.play();
          });

          return Stack(
            children: [
              Container(
                width: MediaQuery.widthOf(context),
                height: MediaQuery.heightOf(context),
                child: currentStory.isVideo
                  ? VideoPlayer(videoController!)
                  : Image.network(
                    width: MediaQuery.widthOf(context),
                    height: MediaQuery.heightOf(context),
                    fit: BoxFit.cover,
                    currentStory.contentUrl
                )
              )
            ],
          );
        }
      ),
    );
  }
}