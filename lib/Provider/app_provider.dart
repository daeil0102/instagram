import 'package:flutter/cupertino.dart';
import 'package:instagram/model/feed_model.dart';
// 뒤에 as <이름> 작성하면 어떤 이름으로 사용할지 정의할 수 있음
// ex. import 'package:instagram/model/feed_model.dart' as feed;
// 사용시 feed.FeedModel 이런식으로 사용할 수 있음
import 'package:instagram/model/story_model.dart';
import 'package:instagram/model/user_model.dart';

final appProvider = AppProvider();

class AppProvider {

  ValueNotifier<int> notifyCount = ValueNotifier(0);

  void updataScreen() {
    notifyCount.value++;
  }

  UserModel? myProfile;

  void loadMyProfile() {
    myProfile = userList[0];
    updataScreen();
  }

  List<StoryModel>? followerStoryList;

  void loadFollowerStoryList() {
    // followerStoryList에 미리 만들어둔 storyList를 얻기
    followerStoryList = storyList;

    // followerStoryList에서 내가 생성한 myProfile의 id와 Story 생성자의 id가 같은 경우
    // myStory 변수에 널기
    final myStory = followerStoryList?.firstWhere((element) {
      return element.creator.id == myProfile?.id;
    });

    // 가져온 myStory가 중복되어 보이지 않도록 기존 followerStoryList에 있던 myStory와 같은 모델을
    // 전부 삭제
    followerStoryList?.remove(myStory);

    // index0의 myStory 넣기
    followerStoryList?.insert(0, myStory!);

    updataScreen();
  }

  List<FeedModel> homeFeedList = [];
  List<int> favoriteFeedIdList= [];
  List<int> moveFeedIdList= [];

  void loadFeedList() {
    homeFeedList = feedList;
    updataScreen();
  }

  void toggleFavoriteFeed(int feedId) {
    if (favoriteFeedIdList.contains(feedId)) {
      favoriteFeedIdList.remove(feedId);
    } else {
      favoriteFeedIdList.add(feedId);
    }
    updataScreen();
  }

  bool isFavoriteFeed(int feedId) {
    return favoriteFeedIdList.contains(feedId);
  }

  void toggleMoveFeed(int feedId) {
    if (moveFeedIdList.contains(feedId)) {
      moveFeedIdList.remove(feedId);
    } else {
      moveFeedIdList.add(feedId);
    }
    updataScreen();
  }

  bool isMoveFeed(int feedId) {
    return moveFeedIdList.contains(feedId);
  }
}