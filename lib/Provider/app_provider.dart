import 'package:flutter/cupertino.dart';
import 'package:instargram/model/story_model.dart';
import 'package:instargram/model/user_model.dart';

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

}