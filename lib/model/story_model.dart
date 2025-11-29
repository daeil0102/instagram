import 'package:instagram/model/user_model.dart';

class StoryModel {
  final UserModel creator;
  final String contentUrl;
  final bool isVideo;

  StoryModel({
    required this.creator,
    required this.contentUrl,
    required this.isVideo
  });
}

final storyList = [
  StoryModel(creator: userList[0],
    contentUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_7DACF7D4514CE68F3F5924FC2828080C.png&type=l340_165",
    isVideo: false,
  ),
  StoryModel(creator: userList[1],
    contentUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpreview.gettyimagesbank.com%2F99%2F2021%2F06%2F85%2F941%2F1322985941.jpg%3Fs%3D1024&type=a340",
    isVideo: false,
  ),
  StoryModel(creator: userList[3],
    contentUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fcdn.crowdpic.net%2Fdetail-thumb%2Fthumb_d_229755379276F5B7202E718B5572915B.png&type=a340",
    isVideo: false,
  )
];